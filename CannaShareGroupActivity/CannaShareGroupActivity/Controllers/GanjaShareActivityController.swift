//
//  GanjaShareActivityController.swift
//  CannaShareGroupActivity
//
//  Created by Wylan L Neely on 1/2/22.
//

import Foundation
import GroupActivities
import Combine

class GanjaShareActivityController: CannabisTypeDelegate {

    @Published var groupSession: GroupSession<GangaShare>?
    
    var messenger: GroupSessionMessenger?
    var subscriptions = Set<AnyCancellable>()
    var tasks = Set<Task<Void, Never>>()
    
    func startSharing() {
        Task {
            do {
                _ = try await GangaShare().activate()
            } catch {
                print("Failed to activate GanjaShare activity: \(error)")
            }
        }
    }
    
    func configureGroupSession(_ groupSession: GroupSession<GangaShare>) {
        self.groupSession = groupSession

        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        
                groupSession.$activeParticipants
            .sink { activeParticipants in
                let newParticipants =
                activeParticipants.subtracting(groupSession.activeParticipants)
                Task {
                    do {
                        try await messenger.send(GanjaMessage(type:self.cannaType!.rawValue),
                                                  to: .only(newParticipants))
                    }  catch {}
                }
            }
            .store(in: &subscriptions)
        
        groupSession.join()
        
        _ = Task.detached { [weak self] in
            for await (message, _) in messenger.messages(of:GanjaMessage.self) {
                 self?.handle(message)
            }
        }
    }
    
    func handle(_ message: GanjaMessage) {
        cannaType = message.cannabisType()
    }
    
    var cannaType: CannabisType?
    
    func cannabisTypeChanged(type: CannabisType) {
        self.cannaType = type
    }
    
}
    

protocol CannabisTypeDelegate {
    var cannaType: CannabisType? {get set}
    func cannabisTypeChanged(type: CannabisType)
}
