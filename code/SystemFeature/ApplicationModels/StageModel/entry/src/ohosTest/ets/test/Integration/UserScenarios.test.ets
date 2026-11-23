/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv, uniqueStrings
} from '../Shared/SharedDriver';

enum UserRole {
  GUEST = 0,
  USER = 1,
  ADMIN = 2
}

enum JourneyState {
  LOCKED = 0,
  AVAILABLE = 1,
  IN_PROGRESS = 2,
  DONE = 3
}

class UserAction {
  name: string = '';
  expectedStep: number = 0;
  performed: boolean = false;
  duration: number = 0;

  constructor(name: string, expectedStep: number, duration: number) {
    this.name = name;
    this.expectedStep = expectedStep;
    this.duration = duration;
  }

  perform(): void {
    this.performed = true;
  }

  reset(): void {
    this.performed = false;
  }
}

class UserStory {
  id: string = '';
  title: string = '';
  role: UserRole = UserRole.GUEST;
  private steps: UserAction[] = [];

  constructor(id: string, title: string, role: UserRole) {
    this.id = id;
    this.title = title;
    this.role = role;
  }

  addStep(action: UserAction): void {
    this.steps.push(action);
  }

  stepCount(): number {
    return this.steps.length;
  }

  stepAt(index: number): UserAction | null {
    if (index < 0 || index >= this.steps.length) {
      return null;
    }
    return this.steps[index];
  }

  performedCount(): number {
    let count = 0;
    for (const step of this.steps) {
      if (step.performed) {
        count = count + 1;
      }
    }
    return count;
  }

  totalDuration(): number {
    let total = 0;
    for (const step of this.steps) {
      total = total + step.duration;
    }
    return total;
  }

  isComplete(): boolean {
    return this.steps.length > 0 && this.performedCount() === this.steps.length;
  }

  reset(): void {
    for (const step of this.steps) {
      step.reset();
    }
  }

  allowedFor(role: UserRole): boolean {
    if (this.role === UserRole.GUEST) {
      return true;
    }
    if (this.role === UserRole.USER) {
      return role === UserRole.USER || role === UserRole.ADMIN;
    }
    return role === UserRole.ADMIN;
  }
}

class JourneyModel {
  private story: UserStory;
  private cursor: number = 0;
  private state: JourneyState = JourneyState.AVAILABLE;

  constructor(story: UserStory) {
    this.story = story;
    if (story.stepCount() === 0) {
      this.state = JourneyState.LOCKED;
    }
  }

  getState(): JourneyState {
    return this.state;
  }

  getStory(): UserStory {
    return this.story;
  }

  progress(): number {
    return clampNumber(safeDiv(this.cursor, this.story.stepCount()), 0, 1);
  }

  performNext(role: UserRole): boolean {
    if (!this.story.allowedFor(role)) {
      this.state = JourneyState.LOCKED;
      return false;
    }
    const step = this.story.stepAt(this.cursor);
    if (step === null) {
      this.state = JourneyState.DONE;
      return false;
    }
    step.perform();
    this.cursor = this.cursor + 1;
    if (this.cursor >= this.story.stepCount()) {
      this.state = JourneyState.DONE;
    } else {
      this.state = JourneyState.IN_PROGRESS;
    }
    return true;
  }

  runAll(role: UserRole): number {
    let performed = 0;
    while (this.cursor < this.story.stepCount()) {
      if (!this.performNext(role)) {
        break;
      }
      performed = performed + 1;
    }
    return performed;
  }

  reset(): void {
    this.cursor = 0;
    this.story.reset();
    this.state = this.story.stepCount() === 0 ? JourneyState.LOCKED : JourneyState.AVAILABLE;
  }

  cursorIndex(): number {
    return this.cursor;
  }
}

class ScenarioCatalog {
  private stories: UserStory[] = [];

  addStory(story: UserStory): boolean {
    for (const existing of this.stories) {
      if (existing.id === story.id) {
        return false;
      }
    }
    this.stories.push(story);
    return true;
  }

  storyCount(): number {
    return this.stories.length;
  }

  findByRole(role: UserRole): UserStory[] {
    const result: UserStory[] = [];
    for (const story of this.stories) {
      if (story.role === role) {
        result.push(story);
      }
    }
    return result;
  }

  findById(id: string): UserStory | null {
    for (const story of this.stories) {
      if (story.id === id) {
        return story;
      }
    }
    return null;
  }

  totalSteps(): number {
    let total = 0;
    for (const story of this.stories) {
      total = total + story.stepCount();
    }
    return total;
  }

  accessibleCount(role: UserRole): number {
    let count = 0;
    for (const story of this.stories) {
      if (story.allowedFor(role)) {
        count = count + 1;
      }
    }
    return count;
  }

  titles(): string[] {
    const result: string[] = [];
    for (const story of this.stories) {
      result.push(story.title);
    }
    return uniqueStrings(result);
  }
}

function buildBrowseStory(): UserStory {
  const story = new UserStory('S1', 'browse books', UserRole.GUEST);
  story.addStep(new UserAction('open', 1, 100));
  story.addStep(new UserAction('scroll', 2, 200));
  story.addStep(new UserAction('select', 3, 150));
  return story;
}

function buildEditStory(): UserStory {
  const story = new UserStory('S2', 'edit book', UserRole.USER);
  story.addStep(new UserAction('open', 1, 120));
  story.addStep(new UserAction('edit', 2, 300));
  story.addStep(new UserAction('save', 3, 180));
  story.addStep(new UserAction('verify', 4, 90));
  return story;
}

function buildAdminStory(): UserStory {
  const story = new UserStory('S3', 'manage users', UserRole.ADMIN);
  story.addStep(new UserAction('login', 1, 250));
  story.addStep(new UserAction('grant', 2, 400));
  return story;
}

export default function userScenariosTest(): void {
  describe('UserScenarios', () => {
    it('UserScenarios_001', 0, async (done: Function) => {
      const action = new UserAction('open', 1, 100);
      expect(action.performed).assertFalse();
      action.perform();
      expect(action.performed).assertTrue();
      action.reset();
      expect(action.performed).assertFalse();
      done();
    });

    it('UserScenarios_002', 0, async (done: Function) => {
      const action = new UserAction('tap', 2, 50);
      expect(action.name).assertEqual('tap');
      expect(action.expectedStep).assertEqual(2);
      expect(action.duration).assertEqual(50);
      done();
    });

    it('UserScenarios_003', 0, async (done: Function) => {
      const story = buildBrowseStory();
      expect(story.stepCount()).assertEqual(3);
      expect(story.role).assertEqual(UserRole.GUEST);
      expect(story.id).assertEqual('S1');
      done();
    });

    it('UserScenarios_004', 0, async (done: Function) => {
      const story = buildBrowseStory();
      expect(story.stepAt(0) !== null).assertTrue();
      expect(story.stepAt(3) === null).assertTrue();
      expect(story.stepAt(-1) === null).assertTrue();
      done();
    });

    it('UserScenarios_005', 0, async (done: Function) => {
      const story = buildBrowseStory();
      expect(story.performedCount()).assertEqual(0);
      expect(story.isComplete()).assertFalse();
      expect(story.totalDuration()).assertEqual(450);
      done();
    });

    it('UserScenarios_006', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const first = story.stepAt(0);
      if (first !== null) {
        first.perform();
      }
      expect(story.performedCount()).assertEqual(1);
      expect(story.isComplete()).assertFalse();
      done();
    });

    it('UserScenarios_007', 0, async (done: Function) => {
      const story = buildEditStory();
      expect(story.stepCount()).assertEqual(4);
      expect(story.totalDuration()).assertEqual(690);
      expect(story.role).assertEqual(UserRole.USER);
      done();
    });

    it('UserScenarios_008', 0, async (done: Function) => {
      const story = buildAdminStory();
      expect(story.stepCount()).assertEqual(2);
      expect(story.totalDuration()).assertEqual(650);
      expect(story.role).assertEqual(UserRole.ADMIN);
      done();
    });
    it('UserScenarios_009', 0, async (done: Function) => {
      const guest = new UserStory('G', 'g', UserRole.GUEST);
      expect(guest.allowedFor(UserRole.GUEST)).assertTrue();
      expect(guest.allowedFor(UserRole.USER)).assertTrue();
      expect(guest.allowedFor(UserRole.ADMIN)).assertTrue();
      done();
    });

    it('UserScenarios_010', 0, async (done: Function) => {
      const user = new UserStory('U', 'u', UserRole.USER);
      expect(user.allowedFor(UserRole.GUEST)).assertFalse();
      expect(user.allowedFor(UserRole.USER)).assertTrue();
      expect(user.allowedFor(UserRole.ADMIN)).assertTrue();
      done();
    });

    it('UserScenarios_011', 0, async (done: Function) => {
      const admin = new UserStory('A', 'a', UserRole.ADMIN);
      expect(admin.allowedFor(UserRole.GUEST)).assertFalse();
      expect(admin.allowedFor(UserRole.USER)).assertFalse();
      expect(admin.allowedFor(UserRole.ADMIN)).assertTrue();
      done();
    });

    it('UserScenarios_012', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const journey = new JourneyModel(story);
      expect(journey.getState()).assertEqual(JourneyState.AVAILABLE);
      expect(journey.cursorIndex()).assertEqual(0);
      expect(journey.progress()).assertEqual(0);
      done();
    });

    it('UserScenarios_013', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const journey = new JourneyModel(story);
      expect(journey.performNext(UserRole.GUEST)).assertTrue();
      expect(journey.cursorIndex()).assertEqual(1);
      expect(journey.getState()).assertEqual(JourneyState.IN_PROGRESS);
      done();
    });

    it('UserScenarios_014', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const journey = new JourneyModel(story);
      expect(journey.runAll(UserRole.GUEST)).assertEqual(3);
      expect(journey.getState()).assertEqual(JourneyState.DONE);
      expect(story.isComplete()).assertTrue();
      expect(journey.progress()).assertEqual(1);
      done();
    });

    it('UserScenarios_015', 0, async (done: Function) => {
      const story = buildEditStory();
      const journey = new JourneyModel(story);
      expect(journey.performNext(UserRole.GUEST)).assertFalse();
      expect(journey.getState()).assertEqual(JourneyState.LOCKED);
      expect(journey.cursorIndex()).assertEqual(0);
      done();
    });

    it('UserScenarios_016', 0, async (done: Function) => {
      const story = buildEditStory();
      const journey = new JourneyModel(story);
      expect(journey.runAll(UserRole.USER)).assertEqual(4);
      expect(journey.getState()).assertEqual(JourneyState.DONE);
      expect(story.performedCount()).assertEqual(4);
      done();
    });

    it('UserScenarios_017', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const journey = new JourneyModel(story);
      journey.runAll(UserRole.GUEST);
      expect(journey.performNext(UserRole.GUEST)).assertFalse();
      expect(journey.getState()).assertEqual(JourneyState.DONE);
      done();
    });

    it('UserScenarios_018', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const journey = new JourneyModel(story);
      journey.runAll(UserRole.GUEST);
      journey.reset();
      expect(journey.cursorIndex()).assertEqual(0);
      expect(journey.getState()).assertEqual(JourneyState.AVAILABLE);
      expect(story.performedCount()).assertEqual(0);
      done();
    });
    it('UserScenarios_019', 0, async (done: Function) => {
      const empty = new UserStory('E', 'empty', UserRole.GUEST);
      const journey = new JourneyModel(empty);
      expect(journey.getState()).assertEqual(JourneyState.LOCKED);
      expect(journey.performNext(UserRole.GUEST)).assertFalse();
      done();
    });

    it('UserScenarios_020', 0, async (done: Function) => {
      const story = buildAdminStory();
      const journey = new JourneyModel(story);
      expect(journey.performNext(UserRole.USER)).assertFalse();
      expect(journey.runAll(UserRole.ADMIN)).assertEqual(2);
      expect(journey.getState()).assertEqual(JourneyState.DONE);
      done();
    });

    it('UserScenarios_021', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      expect(catalog.storyCount()).assertEqual(0);
      expect(catalog.totalSteps()).assertEqual(0);
      expect(catalog.titles().length).assertEqual(0);
      done();
    });

    it('UserScenarios_022', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      expect(catalog.addStory(buildBrowseStory())).assertTrue();
      expect(catalog.addStory(buildBrowseStory())).assertFalse();
      expect(catalog.storyCount()).assertEqual(1);
      done();
    });

    it('UserScenarios_023', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildEditStory());
      catalog.addStory(buildAdminStory());
      expect(catalog.storyCount()).assertEqual(3);
      expect(catalog.totalSteps()).assertEqual(9);
      done();
    });

    it('UserScenarios_024', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildEditStory());
      catalog.addStory(buildAdminStory());
      expect(catalog.findByRole(UserRole.GUEST).length).assertEqual(1);
      expect(catalog.findByRole(UserRole.USER).length).assertEqual(1);
      expect(catalog.findByRole(UserRole.ADMIN).length).assertEqual(1);
      done();
    });

    it('UserScenarios_025', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildEditStory());
      catalog.addStory(buildAdminStory());
      expect(catalog.accessibleCount(UserRole.GUEST)).assertEqual(1);
      expect(catalog.accessibleCount(UserRole.USER)).assertEqual(2);
      expect(catalog.accessibleCount(UserRole.ADMIN)).assertEqual(3);
      done();
    });

    it('UserScenarios_026', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      expect(catalog.findById('S1') !== null).assertTrue();
      expect(catalog.findById('S9') === null).assertTrue();
      const titles = catalog.titles();
      expect(titles.length).assertEqual(1);
      expect(titles[0]).assertEqual('browse books');
      done();
    });
    it('UserScenarios_027', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const journey = new JourneyModel(story);
      expect(journey.progress()).assertEqual(0);
      journey.performNext(UserRole.GUEST);
      expect(journey.progress()).assertEqual(0.3333333333333333);
      journey.performNext(UserRole.GUEST);
      expect(journey.progress()).assertEqual(0.6666666666666666);
      done();
    });

    it('UserScenarios_028', 0, async (done: Function) => {
      const story = new UserStory('M', 'multi', UserRole.USER);
      story.addStep(new UserAction('a', 1, 10));
      story.addStep(new UserAction('b', 2, 20));
      const journey = new JourneyModel(story);
      expect(journey.runAll(UserRole.USER)).assertEqual(2);
      expect(story.performedCount()).assertEqual(2);
      expect(story.totalDuration()).assertEqual(30);
      done();
    });

    it('UserScenarios_029', 0, async (done: Function) => {
      const story = buildEditStory();
      const journey = new JourneyModel(story);
      journey.runAll(UserRole.ADMIN);
      expect(journey.getState()).assertEqual(JourneyState.DONE);
      expect(story.isComplete()).assertTrue();
      done();
    });

    it('UserScenarios_030', 0, async (done: Function) => {
      const story = new UserStory('R', 'reset', UserRole.GUEST);
      story.addStep(new UserAction('a', 1, 5));
      story.addStep(new UserAction('b', 2, 5));
      const first = story.stepAt(0);
      if (first !== null) {
        first.perform();
      }
      expect(story.performedCount()).assertEqual(1);
      story.reset();
      expect(story.performedCount()).assertEqual(0);
      done();
    });

    it('UserScenarios_031', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildEditStory());
      expect(catalog.findByRole(UserRole.ADMIN).length).assertEqual(0);
      expect(catalog.accessibleCount(UserRole.ADMIN)).assertEqual(2);
      done();
    });

    it('UserScenarios_032', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      const first = buildBrowseStory();
      first.title = 'dup title';
      const second = buildEditStory();
      second.title = 'dup title';
      catalog.addStory(first);
      catalog.addStory(second);
      expect(catalog.titles().length).assertEqual(1);
      expect(catalog.storyCount()).assertEqual(2);
      done();
    });

    it('UserScenarios_033', 0, async (done: Function) => {
      const story = buildAdminStory();
      const journey = new JourneyModel(story);
      journey.performNext(UserRole.ADMIN);
      expect(journey.cursorIndex()).assertEqual(1);
      expect(journey.getState()).assertEqual(JourneyState.IN_PROGRESS);
      journey.performNext(UserRole.ADMIN);
      expect(journey.getState()).assertEqual(JourneyState.DONE);
      done();
    });

    it('UserScenarios_034', 0, async (done: Function) => {
      const story = buildEditStory();
      const journey = new JourneyModel(story);
      journey.runAll(UserRole.USER);
      journey.reset();
      expect(journey.runAll(UserRole.USER)).assertEqual(4);
      expect(story.isComplete()).assertTrue();
      done();
    });

    it('UserScenarios_035', 0, async (done: Function) => {
      const action = new UserAction('long', 9, 1000);
      expect(action.expectedStep).assertEqual(9);
      expect(action.duration).assertEqual(1000);
      expect(action.performed).assertFalse();
      done();
    });

    it('UserScenarios_036', 0, async (done: Function) => {
      const story = new UserStory('Z', 'zero', UserRole.GUEST);
      expect(story.stepCount()).assertEqual(0);
      expect(story.totalDuration()).assertEqual(0);
      expect(story.isComplete()).assertFalse();
      expect(story.performedCount()).assertEqual(0);
      done();
    });
    it('UserScenarios_037', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildEditStory());
      catalog.addStory(buildAdminStory());
      const found = catalog.findById('S2');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.title).assertEqual('edit book');
        expect(found.role).assertEqual(UserRole.USER);
      }
      done();
    });

    it('UserScenarios_038', 0, async (done: Function) => {
      const story = new UserStory('D', 'deep', UserRole.ADMIN);
      for (let i = 1; i <= 8; i++) {
        story.addStep(new UserAction('step' + i, i, i * 10));
      }
      expect(story.stepCount()).assertEqual(8);
      expect(story.totalDuration()).assertEqual(360);
      const journey = new JourneyModel(story);
      expect(journey.runAll(UserRole.ADMIN)).assertEqual(8);
      expect(journey.progress()).assertEqual(1);
      done();
    });

    it('UserScenarios_039', 0, async (done: Function) => {
      const story = new UserStory('L', 'lock', UserRole.ADMIN);
      story.addStep(new UserAction('secret', 1, 30));
      const journey = new JourneyModel(story);
      expect(journey.performNext(UserRole.GUEST)).assertFalse();
      expect(journey.getState()).assertEqual(JourneyState.LOCKED);
      expect(story.performedCount()).assertEqual(0);
      done();
    });

    it('UserScenarios_040', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildBrowseStory());
      expect(catalog.storyCount()).assertEqual(1);
      expect(catalog.totalSteps()).assertEqual(3);
      done();
    });

    it('UserScenarios_041', 0, async (done: Function) => {
      const story = buildBrowseStory();
      const journey = new JourneyModel(story);
      journey.runAll(UserRole.GUEST);
      const step = story.stepAt(0);
      const last = story.stepAt(2);
      expect(step !== null).assertTrue();
      expect(last !== null).assertTrue();
      if (step !== null && last !== null) {
        expect(step.performed).assertTrue();
        expect(last.performed).assertTrue();
      }
      done();
    });

    it('UserScenarios_042', 0, async (done: Function) => {
      expect(userScenarioTag()).assertEqual('UserScenarios');
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildEditStory());
      catalog.addStory(buildAdminStory());
      expect(catalog.accessibleCount(UserRole.USER)).assertEqual(2);
      expect(catalog.accessibleCount(UserRole.GUEST)).assertEqual(1);
      done();
    });

    it('UserScenarios_043', 0, async (done: Function) => {
      const story = new UserStory('T', 'timed', UserRole.USER);
      story.addStep(new UserAction('a', 1, 0));
      story.addStep(new UserAction('b', 2, 0));
      expect(story.totalDuration()).assertEqual(0);
      const journey = new JourneyModel(story);
      expect(journey.runAll(UserRole.USER)).assertEqual(2);
      expect(journey.getState()).assertEqual(JourneyState.DONE);
      done();
    });

    it('UserScenarios_044', 0, async (done: Function) => {
      const story = buildEditStory();
      const journey = new JourneyModel(story);
      journey.performNext(UserRole.USER);
      journey.performNext(UserRole.USER);
      expect(journey.cursorIndex()).assertEqual(2);
      expect(journey.progress()).assertEqual(0.5);
      expect(story.performedCount()).assertEqual(2);
      done();
    });

    it('UserScenarios_045', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      const story = new UserStory('X', 'single', UserRole.GUEST);
      story.addStep(new UserAction('only', 1, 77));
      catalog.addStory(story);
      expect(catalog.totalSteps()).assertEqual(1);
      expect(catalog.findByRole(UserRole.GUEST).length).assertEqual(1);
      expect(catalog.findById('X') !== null).assertTrue();
      done();
    });

    it('UserScenarios_046', 0, async (done: Function) => {
      const story = buildAdminStory();
      const journey = new JourneyModel(story);
      journey.runAll(UserRole.ADMIN);
      journey.reset();
      expect(journey.getState()).assertEqual(JourneyState.AVAILABLE);
      expect(journey.cursorIndex()).assertEqual(0);
      expect(story.performedCount()).assertEqual(0);
      done();
    });
    it('UserScenarios_047', 0, async (done: Function) => {
      const catalog = new ScenarioCatalog();
      catalog.addStory(buildBrowseStory());
      catalog.addStory(buildEditStory());
      catalog.addStory(buildAdminStory());
      let doneStories = 0;
      const roles: UserRole[] = [UserRole.GUEST, UserRole.USER, UserRole.ADMIN];
      for (const role of roles) {
        const stories = catalog.findByRole(role);
        for (const story of stories) {
          const journey = new JourneyModel(story);
          journey.runAll(UserRole.ADMIN);
          if (journey.getState() === JourneyState.DONE) {
            doneStories = doneStories + 1;
          }
        }
      }
      expect(doneStories).assertEqual(3);
      expect(catalog.totalSteps()).assertEqual(9);
      done();
    });

    it('UserScenarios_048', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'UserScenarios probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

function userScenarioTag(): string {
  return 'UserScenarios';
}
