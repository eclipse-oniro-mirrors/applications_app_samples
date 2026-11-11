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
import { WorkspaceBackupUiQaFixture, mountWorkspaceBackupUiQa } from '../support/WorkspaceBackupUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct WorkspaceBackupUiQaHarness {
  @LocalStorageProp('qaScenario') scenario: string = 'empty';
  @State ready: boolean = false;
  private fixture: WorkspaceBackupUiQaFixture | undefined = undefined;

  aboutToAppear(): void {
    this.fixture = mountWorkspaceBackupUiQa(this.scenario);
    this.ready = true;
  }

  aboutToDisappear(): void {
    const fixture = this.fixture;
    if (fixture !== undefined) { fixture.release(); }
    this.fixture = undefined;
  }

  build(): void {
    Scroll() {
      Column({ space: 8 }) {
        if (this.ready && this.fixture !== undefined) {
          Text('本地工作区隔离入口已就绪').id('backup-qa-ready').fontSize(12)
          SceneWorkspaceBackup({ controller: this.fixture.controller })
        }
      }.width('100%').padding(8)
    }.id('backup-qa-scroll').width('100%').height('100%')
  }
}
