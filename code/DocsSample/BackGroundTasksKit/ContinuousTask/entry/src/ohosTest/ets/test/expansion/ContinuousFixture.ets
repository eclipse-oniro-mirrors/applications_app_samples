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
// Keep bootstrap import BEFORE the production singleton import.
import {
  bootstrapBarrier, bootstrapCalls, bootstrapPlayer, bootstrapMockInstalled, restoreBootstrapMock
} from './ContinuousBootstrap';
import model from '../../../../main/ets/feature/BackgroundPlayerFeature';
import { MockKit, ArgumentMatchers, expect } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { avSession } from '@kit.AVSessionKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  Deferred, ExternalPlayer, ExternalSession, ExternalResources, ExternalContext, drain, sdkMock
} from './ContinuousExternal';
import { ContinuousCleanup } from './ContinuousCleanup';
import { fileIoMockTarget, sessionMockTarget, hilogMockTarget } from './ContinuousPlayerMockTargets';
export { model, drain };

export class ContinuousFixture {
  public calls: string[] = [];
  public errors: string[] = [];
  public player: ExternalPlayer = new ExternalPlayer(this.calls);
  public sessionA: ExternalSession = new ExternalSession(this.calls);
  public sessionB: ExternalSession = new ExternalSession(this.calls);
  public resources: ExternalResources = new ExternalResources(this.calls);
  public context: common.UIAbilityContext = new ExternalContext(this.resources).asSdk();
  public fileGate: Deferred<fileIo.File> = new Deferred<fileIo.File>();
  public sessionGate: Deferred<avSession.AVSession> = new Deferred<avSession.AVSession>();
  public fileThrows: boolean = false;
  public sessionThrows: boolean = false;
  public sessionContexts: common.Context[] = [];
  public sessionNames: string[] = [];
  public sessionTypes: string[] = [];
  public filePaths: string[] = [];
  public fileModes: number[] = [];
  private mock: MockKit = new MockKit();
  private savedPlayer = model.player;
  private savedSession = model.avSession;
  private savedPlaylist = model.playlist;
  private savedIndex: number = model.playerIndex;
  private savedPlaying: boolean = model.isPlaying;
  private savedCallback = model.prepareCallback;
  private static busy: boolean = false;

  static async open(): Promise<ContinuousFixture> {
    await bootstrapBarrier;
    await drain();
    restoreBootstrapMock();
    expect(bootstrapMockInstalled).assertTrue();
    expect(bootstrapCalls).assertEqual(1);
    expect(bootstrapPlayer.calls.join('|')).assertEqual('on:error|on:stateChange');
    expect(model.player === bootstrapPlayer.asSdk()).assertTrue();
    expect(ContinuousFixture.busy).assertFalse();
    ContinuousFixture.busy = true;
    const fixture = new ContinuousFixture();
    try {
      fixture.install();
      return fixture;
    } catch (error) {
      await fixture.close(true);
      throw error as Error;
    }
  }
  private install(): void {
    model.player = this.player.asSdk();
    model.avSession = this.sessionA.asSdk();
    model.isPlaying = false;
    model.playerIndex = 0;
    model.prepareCallback = null;
    model.getPlaylist((): void => {});
    sdkMock(this.mock, fileIoMockTarget, fileIo.open)
      .stub(ArgumentMatchers.anyString, ArgumentMatchers.anyNumber).afterAction(
      (path: string, mode: number): Promise<fileIo.File> => {
        this.calls.push('open:' + path);
        this.filePaths.push(path);
        this.fileModes.push(mode);
        if (this.fileThrows) {
          throw new Error('controlled open failure');
        }
        return this.fileGate.promise;
      }
    );
    sdkMock(this.mock, sessionMockTarget, avSession.createAVSession)
      .stub(ArgumentMatchers.anyObj, ArgumentMatchers.anyString, ArgumentMatchers.anyString).afterAction(
      (context: common.Context, name: string, type: string): Promise<avSession.AVSession> => {
        this.calls.push('createSession');
        this.sessionContexts.push(context);
        this.sessionNames.push(name);
        this.sessionTypes.push(type);
        if (this.sessionThrows) {
          throw new Error('controlled createSession failure');
        }
        return this.sessionGate.promise;
      }
    );
    sdkMock(this.mock, hilogMockTarget, hilog.error)
      .stub(ArgumentMatchers.anyNumber, ArgumentMatchers.anyString, ArgumentMatchers.anyString, ArgumentMatchers.anyObj)
      .afterAction(
      (domain: number, tag: string, format: string, args: string[]): number => {
        this.errors.push(args.join('|'));
        return 0;
      }
    );
  }
  async close(primaryFailed: boolean = false): Promise<void> {
    const cleanup = new ContinuousCleanup(primaryFailed);
    try {
      this.player.settle();
      await drain();
      // Any unresolved descriptor/session operation is synthetic; settle before
      // restoring public singleton state so no late .then can overwrite it.
      if (!this.fileGate.settled) {
        this.fileGate.resolve(new ExternalFile() as fileIo.File);
      }
      if (!this.resources.gate.settled) {
        this.resources.gate.resolve({ fd: 33, offset: 7, length: 101 });
      }
      if (!this.sessionGate.settled) {
        this.sessionGate.resolve(this.sessionA.asSdk());
      }
      await drain();
    } catch (error) {
      cleanup.capture(error as Error);
    } finally {
      cleanup.run((): void => {
        this.mock.ignoreMock(fileIoMockTarget, fileIo.open);
      });
      cleanup.run((): void => {
        this.mock.ignoreMock(sessionMockTarget, avSession.createAVSession);
      });
      cleanup.run((): void => {
        this.mock.ignoreMock(hilogMockTarget, hilog.error);
      });
      cleanup.run((): void => {
        model.player = this.savedPlayer;
      });
      cleanup.run((): void => {
        model.avSession = this.savedSession;
      });
      cleanup.run((): void => {
        model.playlist = this.savedPlaylist;
      });
      cleanup.run((): void => {
        model.playerIndex = this.savedIndex;
      });
      cleanup.run((): void => {
        model.isPlaying = this.savedPlaying;
      });
      cleanup.run((): void => {
        model.prepareCallback = this.savedCallback;
      });
      cleanup.run((): void => {
        ContinuousFixture.busy = false;
      });
    }
    cleanup.finish();
  }
}
export class ExternalFile {
  public fd: number = 33;
}

// Used only to assert precise propagation, never as catch-and-pass.
export function thrownBy(action: () => void): Error | null {
  try {
    action();
  } catch (error) {
    return error as Error;
  }
  return null;
}
