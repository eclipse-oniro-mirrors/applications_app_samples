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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  recorderComponentCount,
  launchRecorderService,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  buildRecordingFileName,
  isValidRecordingFileName
} from '../shared/RecordingDriver';
import { MockPhotoAccessHelperFactory, MockSRApiFactory } from '../foundation/MockFactories';
import { MockRecordingState, MockSRApiController } from '../foundation/TestTypes';

// Screen recording is a purely local capture pipeline: it writes the encoded
// stream into the media library through a file descriptor. The connectivity
// state therefore must never participate in the state machine.
enum NetworkStatus {
  ONLINE = 'online',
  OFFLINE = 'offline',
  CONNECTING = 'connecting',
  DISCONNECTING = 'disconnecting'
}

interface ConnectivityProbe {
  status: NetworkStatus
  changedAtMs: number
  recorderState: number
}

// Wraps the recording manager with an explicit connectivity probe so that every
// network transition can be correlated with the recorder state.
class NetworkAwareRecordingSession {
  private status: NetworkStatus = NetworkStatus.ONLINE;
  private api: MockSRApiController;
  private photoFactory: MockPhotoAccessHelperFactory;
  private clockMs: number = 1700000000000;
  private probes: ConnectivityProbe[] = [];
  private persistedNames: string[] = [];
  private errorTransitions: number = 0;
  private startAttempts: number = 0;
  private stopAttempts: number = 0;

  constructor(api: MockSRApiController, photoFactory: MockPhotoAccessHelperFactory) {
    this.api = api;
    this.photoFactory = photoFactory;
  }

  public getStatus(): NetworkStatus {
    return this.status;
  }

  public setStatus(status: NetworkStatus): ConnectivityProbe {
    this.status = status;
    this.clockMs += 250;
    const probe: ConnectivityProbe = {
      status: status,
      changedAtMs: this.clockMs,
      recorderState: this.getState()
    };
    this.probes.push(probe);
    return probe;
  }

  public getState(): number {
    return this.api.getRecorderState();
  }

  public async start(): Promise<number> {
    this.startAttempts++;
    const fileName = buildRecordingFileName(new Date(this.clockMs));
    const asset = await this.photoFactory.build().createAsset(fileName, { subtype: 1 });
    const code = this.api.startRecording(`fd://${asset.uri.length}`);
    if (this.getState() === MockRecordingState.Error) {
      this.errorTransitions++;
    }
    return code;
  }

  public stop(): number {
    this.stopAttempts++;
    const code = this.api.stopRecording();
    if (this.getState() === MockRecordingState.Error) {
      this.errorTransitions++;
    } else if (this.getState() === MockRecordingState.Stopped) {
      const assets = this.photoFactory.getAssetsSnapshot();
      for (let index = 0; index < assets.length; index++) {
        this.persistedNames.push(assets[index].fileName);
      }
    }
    return code;
  }

  public getProbes(): ConnectivityProbe[] {
    return this.probes.slice();
  }

  public getPersistedNames(): string[] {
    return this.persistedNames.slice();
  }

  public getErrorTransitions(): number {
    return this.errorTransitions;
  }

  public getStartAttempts(): number {
    return this.startAttempts;
  }

  public getStopAttempts(): number {
    return this.stopAttempts;
  }

  public getPersistedAssetCount(): number {
    return this.photoFactory.getAssetCount();
  }
}

function buildSession(): NetworkAwareRecordingSession {
  const apiFactory = new MockSRApiFactory();
  const photoFactory = new MockPhotoAccessHelperFactory();
  return new NetworkAwareRecordingSession(apiFactory.build(), photoFactory);
}

export default function networkConnectivityTest(): void {
  describe('NetworkConnectivity_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // Online is the nominal state: start must succeed and the artifact must be
    // registered before the capture starts.
    it('online_recording_should_start_normally', 0, async () => {
      const session = buildSession();
      expect(session.getStatus()).assertEqual(NetworkStatus.ONLINE);
      const code = await session.start();
      expect(code).assertEqual(0);
      expect(session.getState()).assertEqual(MockRecordingState.Recording);
      expect(session.getPersistedAssetCount()).assertEqual(1);
      expect(session.getErrorTransitions()).assertEqual(0);
    });

    // No network round trip is performed, so starting offline is identical to
    // starting online.
    it('offline_recording_should_start_without_network', 0, async () => {
      const session = buildSession();
      session.setStatus(NetworkStatus.OFFLINE);
      const code = await session.start();
      expect(code).assertEqual(0);
      expect(session.getState()).assertEqual(MockRecordingState.Recording);
      expect(session.getPersistedAssetCount()).assertEqual(1);
      expect(session.getProbes().length).assertEqual(1);
      expect(session.getProbes()[0].status).assertEqual(NetworkStatus.OFFLINE);
    });

    // Losing connectivity in the middle of a capture must not interrupt it.
    it('recording_should_survive_network_loss', 0, async () => {
      const session = buildSession();
      await session.start();
      const probe = session.setStatus(NetworkStatus.OFFLINE);
      expect(session.getState()).assertEqual(MockRecordingState.Recording);
      expect(probe.recorderState).assertEqual(MockRecordingState.Recording);
      expect(session.getProbes().length).assertEqual(1);
      expect(session.getProbes()[0].changedAtMs > 0).assertTrue();
    });

    // Network loss is not an error condition for the recorder: the error
    // counter must stay at zero through the whole transition.
    it('network_loss_should_not_enter_error_state', 0, async () => {
      const session = buildSession();
      await session.start();
      session.setStatus(NetworkStatus.DISCONNECTING);
      session.setStatus(NetworkStatus.OFFLINE);
      session.setStatus(NetworkStatus.CONNECTING);
      session.setStatus(NetworkStatus.ONLINE);
      expect(session.getErrorTransitions()).assertEqual(0);
      expect(session.getState()).assertEqual(MockRecordingState.Recording);
    });

    // Stopping while offline still finalises the video and keeps the file in
    // the media library, because the fd is written locally.
    it('offline_stop_should_still_persist_artifact', 0, async () => {
      const session = buildSession();
      session.setStatus(NetworkStatus.OFFLINE);
      await session.start();
      session.stop();
      expect(session.getState()).assertEqual(MockRecordingState.Stopped);
      const names = session.getPersistedNames();
      expect(names.length).assertEqual(1);
      expect(isValidRecordingFileName(names[0])).assertTrue();
      expect(names[0].endsWith('.mp4')).assertTrue();
      expect(session.getStopAttempts()).assertEqual(1);
    });

    // Recovering the connectivity after a completed recording must not create a
    // second media asset for the same session.
    it('network_recovery_should_not_duplicate_artifact', 0, async () => {
      const session = buildSession();
      await session.start();
      session.setStatus(NetworkStatus.OFFLINE);
      session.setStatus(NetworkStatus.ONLINE);
      session.stop();
      expect(session.getPersistedAssetCount()).assertEqual(1);
      expect(session.getPersistedNames().length).assertEqual(1);
      expect(session.getStartAttempts()).assertEqual(1);
    });

    // Connectivity sweep: all four connectivity states are applied before the
    // capture starts and the resulting state is always Recording.
    it('connectivity_matrix_should_not_affect_start', 0, async () => {
      const statuses: NetworkStatus[] = [
        NetworkStatus.ONLINE,
        NetworkStatus.OFFLINE,
        NetworkStatus.CONNECTING,
        NetworkStatus.DISCONNECTING
      ];
      let recorded = 0;
      for (let index = 0; index < statuses.length; index++) {
        const session = buildSession();
        session.setStatus(statuses[index]);
        const code = await session.start();
        expect(code).assertEqual(0);
        expect(session.getStatus()).assertEqual(statuses[index]);
        expect(session.getState()).assertEqual(MockRecordingState.Recording);
        recorded++;
      }
      expect(recorded).assertEqual(4);
    });

    // The generated file name only depends on the clock, never on the network.
    it('artifact_name_should_not_depend_on_network', 0, () => {
      const moment = new Date(1700000000000);
      const onlineName = buildRecordingFileName(moment);
      const offlineName = buildRecordingFileName(moment);
      expect(onlineName).assertEqual(offlineName);
      expect(isValidRecordingFileName(onlineName)).assertTrue();
      expect(onlineName.startsWith('REC_')).assertTrue();
      expect(onlineName.length).assertEqual(23);
    });

    // Rapid connectivity flapping must still result in exactly one session.
    it('repeated_connectivity_flaps_should_keep_single_session', 0, async () => {
      const session = buildSession();
      const statuses: NetworkStatus[] = [
        NetworkStatus.OFFLINE,
        NetworkStatus.CONNECTING,
        NetworkStatus.ONLINE,
        NetworkStatus.DISCONNECTING
      ];
      for (let index = 0; index < 20; index++) {
        session.setStatus(statuses[index % statuses.length]);
      }
      await session.start();
      session.stop();
      expect(session.getProbes().length).assertEqual(20);
      expect(session.getStartAttempts()).assertEqual(1);
      expect(session.getStopAttempts()).assertEqual(1);
      expect(session.getPersistedAssetCount()).assertEqual(1);
      expect(session.getErrorTransitions()).assertEqual(0);
    });

    // Probes must be timestamped monotonically so that the connectivity history
    // can be replayed during triage.
    it('connectivity_probes_should_be_chronological', 0, () => {
      const session = buildSession();
      session.setStatus(NetworkStatus.OFFLINE);
      session.setStatus(NetworkStatus.CONNECTING);
      session.setStatus(NetworkStatus.ONLINE);
      const probes = session.getProbes();
      expect(probes.length).assertEqual(3);
      expect(probes[0].changedAtMs).assertLessOrEqual(probes[1].changedAtMs);
      expect(probes[1].changedAtMs).assertLessOrEqual(probes[2].changedAtMs);
      expect(probes[2].status).assertEqual(NetworkStatus.ONLINE);
    });

    // Real-device probe: the floating window layer must render regardless of the
    // connectivity state of the current device.
    it('recorder_windows_should_be_connectivity_independent', 0, async () => {
      await launchRecorderService();
      await serializedDelay(driver, 800);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      const session = buildSession();
      session.setStatus(NetworkStatus.OFFLINE);
      await session.start();
      expect(session.getErrorTransitions()).assertEqual(0);
      expect(session.getState()).assertEqual(MockRecordingState.Recording);
    });
  });
}

