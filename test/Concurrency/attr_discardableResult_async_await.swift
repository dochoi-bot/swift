// RUN: %target-swift-frontend  -disable-availability-checking %s -emit-sil -o /dev/null -verify
// RUN: %target-swift-frontend  -disable-availability-checking %s -emit-sil -o /dev/null -verify -strict-concurrency=targeted
// RUN: %target-swift-frontend  -disable-availability-checking %s -emit-sil -o /dev/null -verify -strict-concurrency=complete
// RUN: %target-swift-frontend  -disable-availability-checking %s -emit-sil -o /dev/null -verify -strict-concurrency=complete -enable-experimental-feature SendNonSendable

// REQUIRES: concurrency

// https://github.com/apple/swift/issues/60276

@discardableResult @MainActor
func mainActorAsyncDiscardable() async -> Int { 0 }

func consumesMainActorAsyncDiscardable() async {
  await mainActorAsyncDiscardable() // ok
}
