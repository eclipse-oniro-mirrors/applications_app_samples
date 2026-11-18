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

import { SceneWorkspaceBackup } from '../../../main/ets/components/SceneWorkspaceBackup';
import {
  WorkspaceBackupUiQaFixture, currentWorkspaceBackupUiQa, failWorkspaceBackupUiQaInitialization
} from '../support/WorkspaceBackupUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct WorkspaceBackupUiQaHarness {
  @LocalStorageProp('qaScenario') scenario: string = 'empty';
  @LocalStorageProp('uiSessionId') sessionId: string = '';
  @State ready: boolean = false;
  private fixture: WorkspaceBackupUiQaFixture | undefined = undefined;
  private readonly scroller: Scroller = new Scroller();
  private readonly scrollOffsetProbe: () => number = (): number => this.scroller.currentOffset().yOffset;

  aboutToAppear(): void {
    try {
      const fixture = currentWorkspaceBackupUiQa(this.sessionId);
      if (fixture.scenario !== this.scenario) { throw new Error('Backup harness selection mismatch'); }
      this.fixture = fixture;
      fixture.attachScrollOffsetProbe(this.scrollOffsetProbe);
      this.ready = true;
    } catch (error) {
      this.ready = false;
      failWorkspaceBackupUiQaInitialization(this.sessionId, 'backup.harness');
    }
  }

  aboutToDisappear(): void {
    this.ready = false;
    this.fixture?.detachScrollOffsetProbe(this.scrollOffsetProbe);
    this.fixture = undefined;
  }

  build(): void {
    Column() {
      if (this.ready && this.fixture !== undefined) {
        Text('本地工作区隔离入口已就绪').id(`backup-qa-ready-${this.sessionId}`).fontSize(12)
      }
      Scroll(this.scroller) {
        Column({ space: 8 }) {
          if (this.ready && this.fixture !== undefined) {
            SceneWorkspaceBackup({ controller: this.fixture.controller })
          }
        }.width('100%').padding(8)
      }.id(`backup-qa-scroll-${this.sessionId}`).width('100%').layoutWeight(1)
    }.width('100%').height('100%')
  }
}
