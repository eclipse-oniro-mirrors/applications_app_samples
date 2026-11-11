import { expect } from '@ohos/hypium';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import {
  ClientFixture, FakeContinueNative, FakeLearningEnvironment, LearningFixture,
  ManualLearningClock, MemoryLearningStore
} from './LearningFixtures';

/** Cleanup is checked before fixture clearAll can hide a leaked business timer. */
export function checkedLearning(body: (fixture: LearningFixture) => void,
  seed: Object | undefined = undefined): void {
  const fixture = new LearningFixture(seed);
  try {
    body(fixture);
  } finally {
    try {
      fixture.controller.dispose();
      expect(fixture.clock.pendingCount()).assertEqual(0);
    } finally {
      fixture.release();
    }
  }
}

export function checkedClient(body: (fixture: ClientFixture) => void): void {
  const fixture = new ClientFixture();
  try {
    body(fixture);
  } finally {
    try {
      fixture.client.dispose();
      expect(fixture.clock.pendingCount()).assertEqual(0);
    } finally {
      fixture.release();
    }
  }
}

/** Observe controller state at the synchronous persistence boundary without changing production ports. */
export class ObservedLearningStore extends MemoryLearningStore {
  public beforeFlush: (() => void) | undefined = undefined;

  public flushSync(): void {
    const inspect = this.beforeFlush;
    if (inspect !== undefined) {
      inspect();
    }
    super.flushSync();
  }
}

export class ObservedLearningFixture implements LearningDependencies {
  public readonly clock: ManualLearningClock = new ManualLearningClock();
  public readonly native: FakeContinueNative = new FakeContinueNative();
  public readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  public readonly store: ObservedLearningStore;
  public readonly controller: LearningController;

  constructor(seed: Object | undefined = undefined) {
    this.store = new ObservedLearningStore(seed);
    this.controller = new LearningController(undefined, this);
  }

  public openStore(): LearningStore {
    return this.store;
  }

  public release(): void {
    try {
      this.controller.dispose();
      expect(this.clock.pendingCount()).assertEqual(0);
    } finally {
      this.store.beforeFlush = undefined;
      this.clock.clearAll();
    }
  }
}
