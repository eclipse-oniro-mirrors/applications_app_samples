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
import { RecycleUiQaFixture, RecycleUiQaAbilitySession, mountRecycleUiQa,
  recycleUiQaOwner } from '../support/RecycleUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct RecycleUiQaHarness {
  @LocalStorageProp('qaScenario') scenario: string = 'empty';
  @LocalStorageProp('qaSessionId') sessionId: string = '';
  @State ready: boolean = false;
  @State closed: boolean = false;
  @State failure: string = '';
  private fixture: RecycleUiQaFixture | undefined = undefined;
  private owner: RecycleUiQaAbilitySession | undefined = undefined;
  private generation: number = 0;

  aboutToAppear(): void {
    let owner: RecycleUiQaAbilitySession;
    try { owner = recycleUiQaOwner(this.sessionId); }
    catch (_) { this.failure = 'Recycle QA session nonce is not owned'; return; }
    this.owner = owner;
    const session = owner.runtime;
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      session.failInitialization('page-context'); this.failure = 'QA host context unavailable'; return;
    }
    const generation = ++this.generation;
    mountRecycleUiQa(context.getApplicationContext(), this.scenario, owner).then((fixture: RecycleUiQaFixture): void => {
      if (generation !== this.generation || this.owner !== owner) {
        try { fixture.dispose(); } catch (_) { session.failCleanup('stale-page-fixture'); }
        owner.forgetFixture(fixture);
        return;
      }
      this.fixture = fixture;
      session.requireLive();
      this.ready = true;
    }).catch((_error: Error): void => {
      session.failInitialization('fixture');
      if (generation === this.generation) { this.failure = 'Recycle QA fixture initialization failed'; }
    });
  }
  aboutToDisappear(): void {
    this.generation++;
    const fixture = this.fixture;
    const owner = this.owner;
    this.fixture = undefined;
    if (fixture !== undefined) {
      try { fixture.dispose(); }
      catch (_) { if (owner !== undefined) { owner.runtime.failCleanup('page-fixture-dispose'); } }
    }
  }
  build(): void {
    Column({ space: 8 }) {
      if (this.ready && this.fixture !== undefined) {
        Text('回收站隔离入口已就绪')
          .id(`recycle-qa-ready-${this.sessionId}`)
          .fontSize(12)
        if (this.closed) {
          Text('回收站已关闭')
            .id('recycle-qa-closed')
        } else {
          NoteRecyclePanel({ store: this.fixture.store, onClose: (): void => { this.closed = true; } })
            .layoutWeight(1)
        }
      } else if (this.failure.length > 0) {
        Text(this.failure)
          .id('recycle-qa-initialization-error')
      }
    }
      .id(`recycle-qa-root-${this.sessionId}`)
      .width('100%')
      .height('100%')
      .padding(8)
  }
}
