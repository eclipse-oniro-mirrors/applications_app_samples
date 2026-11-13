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

import { StartupArchivePanel } from '../../../main/ets/components/StartupArchivePanel';
import { localText } from '../../../main/ets/autostart/text/LocalizedText';
import { ArchiveUiQaFixture, archiveQaErrorCode, bindArchiveUiQa,
  failArchiveUiQaInitialization } from '../support/ArchiveUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct ArchiveUiQaHarness {
  @LocalStorageProp('qaSessionId') sessionId: string = '';
  @State ready: boolean = false;
  @State failure: string = '';
  private fixture: ArchiveUiQaFixture | undefined = undefined;

  aboutToAppear(): void {
    try {
      // Initialization belongs to the owning Ability, not a replaceable page callback.
      this.fixture = bindArchiveUiQa(this.sessionId);
      this.ready = true;
    } catch (error) {
      failArchiveUiQaInitialization(this.sessionId, 'archive-harness-bind', archiveQaErrorCode(error as Error));
      this.failure = 'failed';
    }
  }

  aboutToDisappear(): void {
    this.ready = false;
    this.fixture = undefined;
  }

  build(): void {
    Scroll() {
      Column({ space: 8 }) {
        if (this.ready && this.fixture !== undefined) {
          Text(localText('startup_test_archive_ready'))
            .id(`archive-qa-ready-${this.sessionId}`)
            .fontSize(12)
          StartupArchivePanel({ repository: this.fixture.repository,
            liveRecords: this.fixture.liveRecords, clipboard: this.fixture.clipboard })
        } else if (this.failure.length > 0) {
          Text(localText('startup_test_archive_initialization_failed'))
            .id(`archive-qa-initialization-error-${this.sessionId}`)
        }
      }
      .width('100%')
      .padding(8)
    }
    .id('archive-qa-scroll')
    .width('100%')
    .height('100%')
  }
}
