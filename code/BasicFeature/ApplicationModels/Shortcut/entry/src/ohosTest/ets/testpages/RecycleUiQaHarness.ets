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

import { NoteRecyclePanel } from '../../../main/ets/components/NoteRecyclePanel';
import { RecycleUiQaFixture, mountRecycleUiQa } from '../support/RecycleUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct RecycleUiQaHarness {
  @LocalStorageProp('qaScenario') scenario: string = 'empty';
  @State ready: boolean = false;
  @State closed: boolean = false;
  @State failure: string = '';
  private fixture: RecycleUiQaFixture | undefined = undefined;
  private generation: number = 0;

  aboutToAppear(): void {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) { this.failure = 'QA host context unavailable'; return; }
    const generation = ++this.generation;
    mountRecycleUiQa(context.getApplicationContext(), this.scenario).then((fixture: RecycleUiQaFixture): void => {
      if (generation !== this.generation) { fixture.dispose(); return; }
      this.fixture = fixture;
      this.ready = true;
    }).catch((error: Error): void => { if (generation === this.generation) { this.failure = error.message; } });
  }

  aboutToDisappear(): void {
    this.generation++;
    const fixture = this.fixture;
    if (fixture !== undefined) { fixture.dispose(); }
    this.fixture = undefined;
  }

  build(): void {
    Column({ space: 8 }) {
        if (this.ready && this.fixture !== undefined) {
          Text('回收站隔离入口已就绪').id('recycle-qa-ready').fontSize(12)
          if (this.closed) {
            Text('回收站已关闭').id('recycle-qa-closed')
          } else {
            NoteRecyclePanel({ store: this.fixture.store, onClose: (): void => { this.closed = true; } })
              .layoutWeight(1)
          }
        } else if (this.failure.length > 0) {
          Text(this.failure).id('recycle-qa-initialization-error')
        }
    }.id('recycle-qa-root').width('100%').height('100%').padding(8)
  }
}
