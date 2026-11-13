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
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AvrcpModel,
  AvrcpProfileManager,
  AvrcpService,
  BluetoothConnectionState
} from 'library';
import { AvrcpServiceStatistics } from 'library';

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
  const manager: AvrcpProfileManager = new AvrcpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<AvrcpProfileManager> {
  const manager: AvrcpProfileManager = new AvrcpProfileManager();
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0001', 'begin');
      const manager: AvrcpProfileManager = new AvrcpProfileManager();
      const service: AvrcpService = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#1 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#4 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#5 assert ' + "expect(await manager.pause()).assertFalse()");
      expect(await manager.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#6 assert ' + "expect(await manager.stop()).assertFalse()");
      expect(await manager.stop()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#7 assert ' + "expect(await manager.skipForward()).assertFalse()");
      expect(await manager.skipForward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#8 assert ' + "expect(await manager.skipBackward()).assertFalse()");
      expect(await manager.skipBackward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#9 assert ' + "expect(await manager.setVolume(80)).assertFalse()");
      expect(await manager.setVolume(80)).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#10 assert ' + "expect(manager.getPlaybackState()).assertEqual(0)");
      expect(manager.getPlaybackState()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#11 assert ' + "expect(manager.getTrackName()).assertEqual('')");
      expect(manager.getTrackName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#12 assert ' + "expect(manager.getArtistName()).assertEqual('')");
      expect(manager.getArtistName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#13 assert ' + "expect(manager.getAlbumName()).assertEqual('')");
      expect(manager.getAlbumName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#14 assert ' + "expect(manager.getPosition()).assertEqual(0)");
      expect(manager.getPosition()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#15 assert ' + "expect(manager.getDuration()).assertEqual(0)");
      expect(manager.getDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#16 assert ' + "expect(manager.getPlaylistCount()).assertEqual(0)");
      expect(manager.getPlaylistCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#17 assert ' + "expect(manager.getCurrentTrackIndex()).assertEqual(0)");
      expect(manager.getCurrentTrackIndex()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#18 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#19 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#20 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#21 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#22 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0001',
        '#23 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#1 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#2 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#3 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#4 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      const guarded = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#5 ' + "guarded.length" + ' = ' + JSON.stringify(guarded.length));
      expect(guarded.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#6 ' + "guarded[0]" + ' = ' + JSON.stringify(guarded[0]));
      expect(guarded[0]).assertEqual('initialize');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#7 assert ' + "expect(await manager.pause()).assertTrue()");
      expect(await manager.pause()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#8 assert ' + "expect(await manager.stop()).assertTrue()");
      expect(await manager.stop()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#9 assert ' + "expect(await manager.skipForward()).assertTrue()");
      expect(await manager.skipForward()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#10 assert ' + "expect(await manager.skipBackward()).assertTrue()");
      expect(await manager.skipBackward()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#11 assert ' + "expect(await manager.setVolume(70)).assertTrue()");
      expect(await manager.setVolume(70)).assertTrue();

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#12 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#13 ' + "names[0]" + ' = ' + JSON.stringify(names[0]));
      expect(names[0]).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#14 ' + "names[1]" + ' = ' + JSON.stringify(names[1]));
      expect(names[1]).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#15 ' + "names[2]" + ' = ' + JSON.stringify(names[2]));
      expect(names[2]).assertEqual('stop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#16 ' + "names[3]" + ' = ' + JSON.stringify(names[3]));
      expect(names[3]).assertEqual('skipForward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#17 ' + "names[4]" + ' = ' + JSON.stringify(names[4]));
      expect(names[4]).assertEqual('skipBackward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#18 ' + "names[5]" + ' = ' + JSON.stringify(names[5]));
      expect(names[5]).assertEqual('setVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#19 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(6)");
      expect(manager.getStatistics().totalOperations).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#20 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#21 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: AvrcpServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#22 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#23 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#24 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#25 assert ' + "expect(lastRecord(manager).operationName).assertEqual('setVolume')");
      expect(lastRecord(manager).operationName).assertEqual('setVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0002',
        '#26 assert ' + "expect(lastRecord(manager).details).assertEqual('Volume: 70')");
      expect(lastRecord(manager).details).assertEqual('Volume: 70');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0003', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#2 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#3 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#4 assert ' + "expect(await manager.pause()).assertTrue()");
      expect(await manager.pause()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#5 assert ' + "expect(await manager.stop()).assertTrue()");
      expect(await manager.stop()).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#6 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#7 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#8 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Playback started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#9 ' + "records[2].success" + ' = ' + JSON.stringify(records[2].success));
      expect(records[2].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#10 ' + "records[2].errorMessage" + ' = ' + JSON.stringify(records[2].errorMessage));
      expect(records[2].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#11 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#12 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Playback paused');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#13 ' + "records[4].operationName" + ' = ' + JSON.stringify(records[4].operationName));
      expect(records[4].operationName).assertEqual('stop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#14 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Playback stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#15 ' + "records[4].startTime" + ' = ' + JSON.stringify(records[4].startTime));
      expect(records[4].startTime).assertEqual(records[4].endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#16 ' + "records[4].durationMs" + ' = ' + JSON.stringify(records[4].durationMs));
      expect(records[4].durationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#17 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#18 ' + "records[4].operationId" + ' = ' + JSON.stringify(records[4].operationId));
      expect(records[4].operationId).assertEqual('mgr_op_5');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#19 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#20 assert ' + "expect(manager.getPosition()).assertEqual(0)");
      expect(manager.getPosition()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0003',
        '#21 assert ' + "expect(manager.getCurrentTrackIndex()).assertEqual(0)");
      expect(manager.getCurrentTrackIndex()).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0004', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#1 assert ' + "expect(manager.getPlaybackState()).assertEqual(0)");
      expect(manager.getPlaybackState()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#2 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#3 assert ' + "expect(manager.getPlaybackState()).assertEqual(0)");
      expect(manager.getPlaybackState()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#4 assert ' + "expect(manager.getModel().playbackState).assertEqual(STATE_STOPPED)");
      expect(manager.getModel().playbackState).assertEqual(STATE_STOPPED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#5 assert ' + "expect(lastRecord(manager).operationName).assertEqual('play')");
      expect(lastRecord(manager).operationName).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#6 assert ' + "expect(lastRecord(manager).details).assertEqual('Playback started')");
      expect(lastRecord(manager).details).assertEqual('Playback started');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#7 assert ' + "expect(await manager.pause()).assertTrue()");
      expect(await manager.pause()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#8 assert ' + "expect(manager.getPlaybackState()).assertEqual(0)");
      expect(manager.getPlaybackState()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#9 assert ' + "expect(manager.getModel().playbackState).assertEqual(STATE_STOPPED)");
      expect(manager.getModel().playbackState).assertEqual(STATE_STOPPED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#10 assert ' + "expect(await manager.stop()).assertTrue()");
      expect(await manager.stop()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#11 assert ' + "expect(manager.getPlaybackState()).assertEqual(0)");
      expect(manager.getPlaybackState()).assertEqual(0);

      const exposed: AvrcpModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#12 ' + "exposed.playbackState" + ' = ' + JSON.stringify(exposed.playbackState));
      expect(exposed.playbackState).assertEqual(STATE_STOPPED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#13 ' + "exposed.volume" + ' = ' + JSON.stringify(exposed.volume));
      expect(exposed.volume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#14 assert ' + "expect(manager.getDuration()).assertEqual(0)");
      expect(manager.getDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#15 assert ' + "expect(manager.getPlaylistCount()).assertEqual(0)");
      expect(manager.getPlaylistCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0004',
        '#16 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0005', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#2 assert ' + "expect(await manager.skipForward()).assertTrue()");
      expect(await manager.skipForward()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#3 assert ' + "expect(await manager.setVolume(90)).assertTrue()");
      expect(await manager.setVolume(90)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#4 assert ' + "expect(manager.getTrackName()).assertEqual('')");
      expect(manager.getTrackName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#5 assert ' + "expect(manager.getArtistName()).assertEqual('')");
      expect(manager.getArtistName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#6 assert ' + "expect(manager.getAlbumName()).assertEqual('')");
      expect(manager.getAlbumName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#7 assert ' + "expect(manager.getDuration()).assertEqual(0)");
      expect(manager.getDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#8 assert ' + "expect(manager.getPlaylistCount()).assertEqual(0)");
      expect(manager.getPlaylistCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#9 assert ' + "expect(manager.getPosition()).assertEqual(0)");
      expect(manager.getPosition()).assertEqual(0);

      const exposed = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#10 ' + "exposed.trackName" + ' = ' + JSON.stringify(exposed.trackName));
      expect(exposed.trackName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#11 ' + "exposed.artistName" + ' = ' + JSON.stringify(exposed.artistName));
      expect(exposed.artistName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#12 ' + "exposed.albumName" + ' = ' + JSON.stringify(exposed.albumName));
      expect(exposed.albumName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#13 ' + "exposed.duration" + ' = ' + JSON.stringify(exposed.duration));
      expect(exposed.duration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#14 ' + "exposed.playlistCount" + ' = ' + JSON.stringify(exposed.playlistCount));
      expect(exposed.playlistCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#15 ' + "exposed.volume" + ' = ' + JSON.stringify(exposed.volume));
      expect(exposed.volume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#16 ' + "exposed.position" + ' = ' + JSON.stringify(exposed.position));
      expect(exposed.position).assertEqual(0);

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#17 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#18 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Volume: 90');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0005',
        '#19 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Track 0');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0006', 'begin');
      const manager = await connectedManager(DEVICE_A);
      for (let i = 0; i < 3; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#1 assert ' + "expect(await manager.skipForward()).assertTrue()");
        expect(await manager.skipForward()).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#2 assert ' + "expect(manager.getCurrentTrackIndex()).assertEqual(0)");
        expect(manager.getCurrentTrackIndex()).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#3 assert ' + "expect(manager.getPosition()).assertEqual(0)");
        expect(manager.getPosition()).assertEqual(0);
      }
      for (let i = 0; i < 2; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#4 assert ' + "expect(await manager.skipBackward()).assertTrue()");
        expect(await manager.skipBackward()).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#5 assert ' + "expect(manager.getCurrentTrackIndex()).assertEqual(0)");
        expect(manager.getCurrentTrackIndex()).assertEqual(0);
      }
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
        '#6 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(7);
      for (let i = 2; i < 5; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#7 ' + "records[i].operationName" + ' = ' + JSON.stringify(records[i].operationName));
        expect(records[i].operationName).assertEqual('skipForward');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#8 ' + "records[i].details" + ' = ' + JSON.stringify(records[i].details));
        expect(records[i].details).assertEqual('Track 0');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
          '#9 ' + "records[i].success" + ' = ' + JSON.stringify(records[i].success));
        expect(records[i].success).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
        '#10 ' + "records[5].details" + ' = ' + JSON.stringify(records[5].details));
      expect(records[5].details).assertEqual('Track 0');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
        '#11 ' + "records[6].operationName" + ' = ' + JSON.stringify(records[6].operationName));
      expect(records[6].operationName).assertEqual('skipBackward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
        '#12 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0006',
        '#13 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0007', 'begin');
      const manager = await readyManager();
      const inputs: number[] = [-5, 150, 33.6, 0, 100, 55.4];
      const expected: number[] = [0, 100, 34, 0, 100, 55];
      for (let i = 0; i < inputs.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
          '#1 assert ' + "expect(await manager.setVolume(inputs[i])).assertTrue()");
        expect(await manager.setVolume(inputs[i])).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
          '#2 assert ' + "expect(lastRecord(manager).details).assertEqual(`Volume: ${expected[i]}`)");
        expect(lastRecord(manager).details).assertEqual(`Volume: ${expected[i]}`);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
          '#3 assert ' + "expect(lastRecord(manager).operationName).assertEqual('setVolume')");
        expect(lastRecord(manager).operationName).assertEqual('setVolume');
      }
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
        '#4 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
        '#5 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('setVolume');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
        '#6 assert ' + "expect(manager.getModel().volume).assertEqual(DEFAULT_VOLUME)");
      expect(manager.getModel().volume).assertEqual(DEFAULT_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
        '#7 assert ' + "expect(manager.getStatistics().successfulOperations).assertEqual(7)");
      expect(manager.getStatistics().successfulOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
        '#8 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(7)");
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0007',
        '#9 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0008', 'begin');
      const manager: AvrcpProfileManager = new AvrcpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#1 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#2 assert ' + "expect(await manager.pause()).assertFalse()");
      expect(await manager.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#3 assert ' + "expect(await manager.stop()).assertFalse()");
      expect(await manager.stop()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#4 assert ' + "expect(await manager.skipForward()).assertFalse()");
      expect(await manager.skipForward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#5 assert ' + "expect(await manager.skipBackward()).assertFalse()");
      expect(await manager.skipBackward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#6 assert ' + "expect(await manager.setVolume(10)).assertFalse()");
      expect(await manager.setVolume(10)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#7 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#8 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#9 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#10 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#11 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#12 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#13 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#14 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#15 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#16 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(1)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#17 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#18 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#19 assert ' + "expect(manager.getStatistics().successfulOperations).assertEqual(3)");
      expect(manager.getStatistics().successfulOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0008',
        '#20 assert ' + "expect(lastRecord(manager).operationId).assertEqual('mgr_op_3')");
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_3');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0009', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] = [manager.play(), manager.pause(), manager.stop()];
      const results: boolean[] = await Promise.all(tasks);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#1 ' + "results.length" + ' = ' + JSON.stringify(results.length));
      expect(results.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#2 ' + "results[0]" + ' = ' + JSON.stringify(results[0]));
      expect(results[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#3 ' + "results[1]" + ' = ' + JSON.stringify(results[1]));
      expect(results[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#4 ' + "results[2]" + ' = ' + JSON.stringify(results[2]));
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#5 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#6 ' + "names[2]" + ' = ' + JSON.stringify(names[2]));
      expect(names[2]).assertEqual('play');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#7 ' + "names[3]" + ' = ' + JSON.stringify(names[3]));
      expect(names[3]).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#8 ' + "names[4]" + ' = ' + JSON.stringify(names[4]));
      expect(names[4]).assertEqual('stop');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#9 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(5)");
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#10 assert ' + "expect(manager.getPosition()).assertEqual(0)");
      expect(manager.getPosition()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#11 assert ' + "expect(manager.getPlaybackState()).assertEqual(0)");
      expect(manager.getPlaybackState()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0009',
        '#12 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0010', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#2 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#3 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#4 assert ' +
        "expect(manager.getService().getConnectionState()) .assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);

      const recordsBefore = recordsOf(manager).length;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#5 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#6 assert ' + "expect(recordsOf(manager).length).assertEqual(recordsBefore)");
      expect(recordsOf(manager).length).assertEqual(recordsBefore);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#7 assert ' + "expect(await manager.pause()).assertTrue()");
      expect(await manager.pause()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#8 assert ' + "expect(await manager.setVolume(20)).assertTrue()");
      expect(await manager.setVolume(20)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#9 assert ' + "expect(await manager.skipForward()).assertTrue()");
      expect(await manager.skipForward()).assertTrue();
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#10 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(recordsBefore + 3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#11 ' + "records[records.length - 3].operationName" + ' = ' +
        JSON.stringify(records[records.length - 3].operationName));
      expect(records[records.length - 3].operationName).assertEqual('pause');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#12 ' + "records[records.length - 2].details" + ' = ' + JSON.stringify(records[records.length - 2].details));
      expect(records[records.length - 2].details).assertEqual('Volume: 20');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#13 ' + "records[records.length - 1].details" + ' = ' + JSON.stringify(records[records.length - 1].details));
      expect(records[records.length - 1].details).assertEqual('Track 0');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#14 assert ' + "expect(manager.getModel().playbackState).assertEqual('stopped')");
      expect(manager.getModel().playbackState).assertEqual('stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0010',
        '#15 assert ' + "expect(manager.getCurrentTrackIndex()).assertEqual(0)");
      expect(manager.getCurrentTrackIndex()).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#2 assert ' + "expect(await manager.setVolume(60)).assertTrue()");
      expect(await manager.setVolume(60)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#3 assert ' + "expect(manager.getOperationRecords().length).assertEqual(4)");
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.reset();
      const afterReset = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#4 ' + "afterReset.length" + ' = ' + JSON.stringify(afterReset.length));
      expect(afterReset.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#5 ' + "afterReset[0].operationName" + ' = ' + JSON.stringify(afterReset[0].operationName));
      expect(afterReset[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#6 ' + "afterReset[0].operationId" + ' = ' + JSON.stringify(afterReset[0].operationId));
      expect(afterReset[0].operationId).assertEqual('mgr_op_6');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#7 ' + "afterReset[0].details" + ' = ' + JSON.stringify(afterReset[0].details));
      expect(afterReset[0].details).assertEqual('Manager reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#8 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#9 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#10 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#11 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#12 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#13 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#14 assert ' + "expect(await manager.pause()).assertTrue()");
      expect(await manager.pause()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#15 assert ' + "expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7')");
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#16 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(7)");
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0011',
        '#17 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0012', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#1 assert ' + "expect(await manager.play()).assertTrue()");
      expect(await manager.play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#2 assert ' + "expect(await manager.setVolume(100)).assertTrue()");
      expect(await manager.setVolume(100)).assertTrue();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#3 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#4 assert ' + "expect(await manager.pause()).assertFalse()");
      expect(await manager.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#5 assert ' + "expect(await manager.stop()).assertFalse()");
      expect(await manager.stop()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#6 assert ' + "expect(await manager.skipForward()).assertFalse()");
      expect(await manager.skipForward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#7 assert ' + "expect(await manager.skipBackward()).assertFalse()");
      expect(await manager.skipBackward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#8 assert ' + "expect(await manager.setVolume(30)).assertFalse()");
      expect(await manager.setVolume(30)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#9 assert ' + "expect(manager.getPlaybackState()).assertEqual(0)");
      expect(manager.getPlaybackState()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#10 assert ' + "expect(manager.getTrackName()).assertEqual('')");
      expect(manager.getTrackName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#11 assert ' + "expect(manager.getArtistName()).assertEqual('')");
      expect(manager.getArtistName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#12 assert ' + "expect(manager.getAlbumName()).assertEqual('')");
      expect(manager.getAlbumName()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#13 assert ' + "expect(manager.getPosition()).assertEqual(0)");
      expect(manager.getPosition()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#14 assert ' + "expect(manager.getDuration()).assertEqual(0)");
      expect(manager.getDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#15 assert ' + "expect(manager.getPlaylistCount()).assertEqual(0)");
      expect(manager.getPlaylistCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#16 assert ' + "expect(manager.getCurrentTrackIndex()).assertEqual(0)");
      expect(manager.getCurrentTrackIndex()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#17 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#18 assert ' + "expect(manager.getModel().volume).assertEqual(DEFAULT_VOLUME)");
      expect(manager.getModel().volume).assertEqual(DEFAULT_VOLUME);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#19 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#20 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#21 assert ' + "expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1')");
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#22 assert ' + "expect(recordsOf(manager)[0].details).assertEqual('Manager initialized')");
      expect(recordsOf(manager)[0].details).assertEqual('Manager initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#23 assert ' + "expect(await manager.setVolume(45)).assertTrue()");
      expect(await manager.setVolume(45)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#24 assert ' + "expect(lastRecord(manager).details).assertEqual('Volume: 45')");
      expect(lastRecord(manager).details).assertEqual('Volume: 45');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#25 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#26 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const svcStats: AvrcpServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#27 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#28 ' + "svcStats.serviceName" + ' = ' + JSON.stringify(svcStats.serviceName));
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#29 ' + "svcStats.isInitialized" + ' = ' + JSON.stringify(svcStats.isInitialized));
      expect(svcStats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testAvrcpMedia0012',
        '#30 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testAvrcpMedia0012', 'end');
    });
  });
}
