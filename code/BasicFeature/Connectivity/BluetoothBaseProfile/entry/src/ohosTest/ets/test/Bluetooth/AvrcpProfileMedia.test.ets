/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import {
  AvrcpModel,
  AvrcpProfileManager,
  AvrcpService,
  BluetoothConnectionState
} from 'library';

/**
 * @description Test suite for AVRCP playback control and metadata operations of AvrcpProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'AvrcpService';
const DEVICE_A: string = 'avrcp_media_device_a';
const DEVICE_B: string = 'avrcp_media_device_b';
const DEFAULT_VOLUME: number = 50;
const STATE_STOPPED: string = 'stopped';

interface RecordView {
  operationId: string;
  operationName: string;
  startTime: number;
  endTime: number;
  durationMs: number;
  success: boolean;
  errorMessage: string;
  details: string;
}

function recordsOf(manager: AvrcpProfileManager): RecordView[] {
  const source = manager.getOperationRecords();
  const list: RecordView[] = [];
  for (let i = 0; i < source.length; i++) {
    list.push({
      operationId: source[i].operationId,
      operationName: source[i].operationName,
      startTime: source[i].startTime,
      endTime: source[i].endTime,
      durationMs: source[i].durationMs,
      success: source[i].success,
      errorMessage: source[i].errorMessage,
      details: source[i].details
    });
  }
  return list;
}

function lastRecord(manager: AvrcpProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function recordNames(manager: AvrcpProfileManager): string[] {
  const list = recordsOf(manager);
  const names: string[] = [];
  for (let i = 0; i < list.length; i++) {
    names.push(list[i].operationName);
  }
  return names;
}

function serviceHistoryCount(manager: AvrcpProfileManager): number {
  return manager.getService().getOperationHistory().length;
}

async function readyManager(): Promise<AvrcpProfileManager> {
  const manager = new AvrcpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<AvrcpProfileManager> {
  const manager = new AvrcpProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

export default function avrcpProfileMediaTest(): void {
  describe('AvrcpProfileMediaTest', () => {
    /*
     * @tc.number: SUB_AVRCP_MEDIA_0100
     * @tc.name: testAvrcpMedia0001
     * @tc.desc: Verify that all media operations are refused and metadata reads empty before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpMedia0001', 0, async () => {
      const manager = new AvrcpProfileManager();
      const service: AvrcpService = manager.getService();
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertFalse();
      expect(await manager.stop()).assertFalse();
      expect(await manager.skipForward()).assertFalse();
      expect(await manager.skipBackward()).assertFalse();
      expect(await manager.setVolume(80)).assertFalse();

      expect(manager.getPlaybackState()).assertEqual(0);
      expect(manager.getTrackName()).assertEqual('');
      expect(manager.getArtistName()).assertEqual('');
      expect(manager.getAlbumName()).assertEqual('');
      expect(manager.getPosition()).assertEqual(0);
      expect(manager.getDuration()).assertEqual(0);
      expect(manager.getPlaylistCount()).assertEqual(0);
      expect(manager.getCurrentTrackIndex()).assertEqual(0);

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(manager.isConnected()).assertFalse();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0200
     * @tc.name: testAvrcpMedia0002
     * @tc.desc: Verify that only the play request requires a managed device while other controls proceed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpMedia0002', 0, async () => {
      const manager = await readyManager();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();

      expect(await manager.play()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      const guarded = recordNames(manager);
      expect(guarded.length).assertEqual(1);
      expect(guarded[0]).assertEqual('initialize');

      expect(await manager.pause()).assertTrue();
      expect(await manager.stop()).assertTrue();
      expect(await manager.skipForward()).assertTrue();
      expect(await manager.skipBackward()).assertTrue();
      expect(await manager.setVolume(70)).assertTrue();

      const names = recordNames(manager);
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual('initialize');
      expect(names[1]).assertEqual('pause');
      expect(names[2]).assertEqual('stop');
      expect(names[3]).assertEqual('skipForward');
      expect(names[4]).assertEqual('skipBackward');
      expect(names[5]).assertEqual('setVolume');
      expect(manager.getStatistics().totalOperations).assertEqual(6);
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: ESObject = manager.getService().getStatistics();
      expect(stats.operationHistoryCount).assertEqual(1);
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      expect(stats.isInitialized).assertTrue();
      expect(lastRecord(manager).operationName).assertEqual('setVolume');
      expect(lastRecord(manager).details).assertEqual('Volume: 70');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0300
     * @tc.name: testAvrcpMedia0003
     * @tc.desc: Verify the recorded details of a full playback sequence on a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpMedia0003', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      expect(await manager.play()).assertTrue();
      expect(await manager.pause()).assertTrue();
      expect(await manager.stop()).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(5);
      expect(records[2].operationName).assertEqual('play');
      expect(records[2].details).assertEqual('Playback started');
      expect(records[2].success).assertTrue();
      expect(records[2].errorMessage).assertEqual('');
      expect(records[3].operationName).assertEqual('pause');
      expect(records[3].details).assertEqual('Playback paused');
      expect(records[4].operationName).assertEqual('stop');
      expect(records[4].details).assertEqual('Playback stopped');
      expect(records[4].startTime).assertEqual(records[4].endTime);
      expect(records[4].durationMs).assertEqual(0);
      expect(records[2].operationId).assertEqual('mgr_op_3');
      expect(records[4].operationId).assertEqual('mgr_op_5');

      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(manager.getPosition()).assertEqual(0);
      expect(manager.getCurrentTrackIndex()).assertEqual(0);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0400
     * @tc.name: testAvrcpMedia0004
     * @tc.desc: Verify that the numeric playback state stays zero although the textual state changes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpMedia0004', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getPlaybackState()).assertEqual(0);

      expect(await manager.play()).assertTrue();
      expect(manager.getPlaybackState()).assertEqual(0);
      expect(manager.getModel().playbackState).assertEqual(STATE_STOPPED);
      expect(lastRecord(manager).operationName).assertEqual('play');
      expect(lastRecord(manager).details).assertEqual('Playback started');

      expect(await manager.pause()).assertTrue();
      expect(manager.getPlaybackState()).assertEqual(0);
      expect(manager.getModel().playbackState).assertEqual(STATE_STOPPED);
      expect(await manager.stop()).assertTrue();
      expect(manager.getPlaybackState()).assertEqual(0);

      const exposed: AvrcpModel = manager.getModel();
      expect(exposed.playbackState).assertEqual(STATE_STOPPED);
      expect(exposed.volume).assertEqual(DEFAULT_VOLUME);
      expect(manager.getDuration()).assertEqual(0);
      expect(manager.getPlaylistCount()).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0500
     * @tc.name: testAvrcpMedia0005
     * @tc.desc: Verify that track metadata stays empty because no source ever fills the media model.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpMedia0005', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.play()).assertTrue();
      expect(await manager.skipForward()).assertTrue();
      expect(await manager.setVolume(90)).assertTrue();

      expect(manager.getTrackName()).assertEqual('');
      expect(manager.getArtistName()).assertEqual('');
      expect(manager.getAlbumName()).assertEqual('');
      expect(manager.getDuration()).assertEqual(0);
      expect(manager.getPlaylistCount()).assertEqual(0);
      expect(manager.getPosition()).assertEqual(0);

      const exposed = manager.getModel();
      expect(exposed.trackName).assertEqual('');
      expect(exposed.artistName).assertEqual('');
      expect(exposed.albumName).assertEqual('');
      expect(exposed.duration).assertEqual(0);
      expect(exposed.playlistCount).assertEqual(0);
      expect(exposed.volume).assertEqual(DEFAULT_VOLUME);
      expect(exposed.position).assertEqual(0);

      const records = recordsOf(manager);
      expect(records.length).assertEqual(5);
      expect(records[4].details).assertEqual('Volume: 90');
      expect(records[3].details).assertEqual('Track 0');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0600
     * @tc.name: testAvrcpMedia0006
     * @tc.desc: Verify that track skipping on an empty playlist reports success without moving the index.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpMedia0006', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      for (let i = 0; i < 3; i++) {
        expect(await manager.skipForward()).assertTrue();
        expect(manager.getCurrentTrackIndex()).assertEqual(0);
        expect(manager.getPosition()).assertEqual(0);
      }
      for (let i = 0; i < 2; i++) {
        expect(await manager.skipBackward()).assertTrue();
        expect(manager.getCurrentTrackIndex()).assertEqual(0);
      }
      const records = recordsOf(manager);
      expect(records.length).assertEqual(7);
      for (let i = 2; i < 5; i++) {
        expect(records[i].operationName).assertEqual('skipForward');
        expect(records[i].details).assertEqual('Track 0');
        expect(records[i].success).assertTrue();
      }
      expect(records[5].details).assertEqual('Track 0');
      expect(records[6].operationName).assertEqual('skipBackward');
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0700
     * @tc.name: testAvrcpMedia0007
     * @tc.desc: Verify volume rounding and clamping while the exposed model keeps its own value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpMedia0007', 0, async () => {
      const manager = await readyManager();
      const inputs: number[] = [-5, 150, 33.6, 0, 100, 55.4];
      const expected: number[] = [0, 100, 34, 0, 100, 55];
      for (let i = 0; i < inputs.length; i++) {
        expect(await manager.setVolume(inputs[i])).assertTrue();
        expect(lastRecord(manager).details).assertEqual(`Volume: ${expected[i]}`);
        expect(lastRecord(manager).operationName).assertEqual('setVolume');
      }
      const records = recordsOf(manager);
      expect(records.length).assertEqual(7);
      expect(records[1].operationName).assertEqual('setVolume');
      expect(manager.getModel().volume).assertEqual(DEFAULT_VOLUME);
      expect(manager.getStatistics().successfulOperations).assertEqual(7);
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0800
     * @tc.name: testAvrcpMedia0008
     * @tc.desc: Verify that refused operations leave no trace in the manager operation records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpMedia0008', 0, async () => {
      const manager = new AvrcpProfileManager();
      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertFalse();
      expect(await manager.stop()).assertFalse();
      expect(await manager.skipForward()).assertFalse();
      expect(await manager.skipBackward()).assertFalse();
      expect(await manager.setVolume(10)).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      expect(await manager.initialize()).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(await manager.play()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      expect(await manager.play()).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(3);
      expect(manager.getStatistics().successfulOperations).assertEqual(3);
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_3');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_0900
     * @tc.name: testAvrcpMedia0009
     * @tc.desc: Verify the recorded order when play, pause and stop are issued concurrently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpMedia0009', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] = [manager.play(), manager.pause(), manager.stop()];
      const results: boolean[] = await Promise.all(tasks);
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual('play');
      expect(names[3]).assertEqual('pause');
      expect(names[4]).assertEqual('stop');
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      expect(manager.getPosition()).assertEqual(0);
      expect(manager.getPlaybackState()).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_1000
     * @tc.name: testAvrcpMedia0010
     * @tc.desc: Verify that losing the device blocks play but still allows pause and volume changes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpMedia0010', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.play()).assertTrue();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);

      const recordsBefore = recordsOf(manager).length;
      expect(await manager.play()).assertFalse();
      expect(recordsOf(manager).length).assertEqual(recordsBefore);

      expect(await manager.pause()).assertTrue();
      expect(await manager.setVolume(20)).assertTrue();
      expect(await manager.skipForward()).assertTrue();
      const records = recordsOf(manager);
      expect(records.length).assertEqual(recordsBefore + 3);
      expect(records[records.length - 3].operationName).assertEqual('pause');
      expect(records[records.length - 2].details).assertEqual('Volume: 20');
      expect(records[records.length - 1].details).assertEqual('Track 0');
      expect(manager.getModel().playbackState).assertEqual('stopped');
      expect(manager.getCurrentTrackIndex()).assertEqual(0);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_1100
     * @tc.name: testAvrcpMedia0011
     * @tc.desc: Verify that reset clears records and the operation identifier counter keeps increasing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpMedia0011', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.play()).assertTrue();
      expect(await manager.setVolume(60)).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.reset();
      const afterReset = recordsOf(manager);
      expect(afterReset.length).assertEqual(1);
      expect(afterReset[0].operationName).assertEqual('reset');
      expect(afterReset[0].operationId).assertEqual('mgr_op_6');
      expect(afterReset[0].details).assertEqual('Manager reset');
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertTrue();
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7');
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      expect(manager.getOperationRecords().length).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_MEDIA_1200
     * @tc.name: testAvrcpMedia0012
     * @tc.desc: Verify the manager state after destroy and after a second initialization cycle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpMedia0012', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.play()).assertTrue();
      expect(await manager.setVolume(100)).assertTrue();

      await manager.destroy();
      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertFalse();
      expect(await manager.stop()).assertFalse();
      expect(await manager.skipForward()).assertFalse();
      expect(await manager.skipBackward()).assertFalse();
      expect(await manager.setVolume(30)).assertFalse();
      expect(manager.getPlaybackState()).assertEqual(0);
      expect(manager.getTrackName()).assertEqual('');
      expect(manager.getArtistName()).assertEqual('');
      expect(manager.getAlbumName()).assertEqual('');
      expect(manager.getPosition()).assertEqual(0);
      expect(manager.getDuration()).assertEqual(0);
      expect(manager.getPlaylistCount()).assertEqual(0);
      expect(manager.getCurrentTrackIndex()).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getModel().volume).assertEqual(DEFAULT_VOLUME);

      expect(await manager.initialize()).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      expect(recordsOf(manager)[0].details).assertEqual('Manager initialized');
      expect(await manager.setVolume(45)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Volume: 45');
      expect(await manager.play()).assertFalse();
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const svcStats: ESObject = manager.getService().getStatistics();
      expect(svcStats.operationHistoryCount).assertEqual(1);
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);
      expect(svcStats.isInitialized).assertTrue();
      expect(svcStats.connectedDeviceCount).assertEqual(0);

      await manager.destroy();
    });
  });
}
