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
import { NetworkState, NetworkType, NetworkUtils } from 'library';

/**
 * Test suite for NetworkUtils.
 * @since 26.0.0
 */
class RecordingNetworkCallback {
  public availableTypes: NetworkType[] = [];
  public lostCount: number = 0;

  onAvailable(type: NetworkType): void {
    this.availableTypes.push(type);
  }

  onLost(): void {
    this.lostCount++;
  }
}

class ThrowingNetworkCallback {
  onAvailable(type: NetworkType): void {
    throw new Error('network callback failure ' + type);
  }

  onLost(): void {
    throw new Error('network callback failure');
  }
}

export default function networkUtilsTest(): void {
  describe('NetworkUtilsTest', () => {
    // ==================== default state state and class type (4 cases) ====================

    /*
     * @tc.number: SUB_NETWORK_UTILS_0100
     * @tc.name: testNetworkUtils0001
     * @tc.desc: Reset the network helper and read the unknown disconnected baseline.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0001', 'begin');
      NetworkUtils.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0001',
        '#1 assert ' + "expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.UNKNOWN)");
      expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.UNKNOWN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0001',
        '#2 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0001',
        '#3 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0001',
        '#4 assert ' + "expect(NetworkUtils.isWifi()).assertFalse()");
      expect(NetworkUtils.isWifi()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0001',
        '#5 assert ' + "expect(NetworkUtils.isCellular()).assertFalse()");
      expect(NetworkUtils.isCellular()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0001',
        '#6 assert ' + "expect(NetworkUtils.isBluetooth()).assertFalse()");
      expect(NetworkUtils.isBluetooth()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0001', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_0200
     * @tc.name: testNetworkUtils0002
     * @tc.desc: Switch through every supported network type and read it back.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0002', 'begin');
      NetworkUtils.reset();
      const types: NetworkType[] = [NetworkType.WIFI, NetworkType.CELLULAR, NetworkType.ETHERNET,
        NetworkType.BLUETOOTH, NetworkType.NONE, NetworkType.UNKNOWN];
      let matched: number = 0;
      for (const type of types) {
        NetworkUtils.setNetworkType(type);
        if (NetworkUtils.getNetworkType() === type) {
          matched++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0002',
        '#1 ' + "matched" + ' = ' + JSON.stringify(matched));
      expect(matched).assertEqual(types.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0002',
        '#2 assert ' + "expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.UNKNOWN)");
      expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.UNKNOWN);
      NetworkUtils.setNetworkType(NetworkType.WIFI);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0002',
        '#3 assert ' + "expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.WIFI)");
      expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.WIFI);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0002',
        '#4 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0002',
        '#5 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0002', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_0300
     * @tc.name: testNetworkUtils0003
     * @tc.desc: Drive the three capability flags from the selected network type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0003', 'begin');
      NetworkUtils.reset();
      NetworkUtils.setNetworkType(NetworkType.WIFI);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#1 assert ' + "expect(NetworkUtils.isWifi()).assertTrue()");
      expect(NetworkUtils.isWifi()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#2 assert ' + "expect(NetworkUtils.isCellular()).assertFalse()");
      expect(NetworkUtils.isCellular()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#3 assert ' + "expect(NetworkUtils.isBluetooth()).assertFalse()");
      expect(NetworkUtils.isBluetooth()).assertFalse();

      NetworkUtils.setNetworkType(NetworkType.CELLULAR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#4 assert ' + "expect(NetworkUtils.isWifi()).assertFalse()");
      expect(NetworkUtils.isWifi()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#5 assert ' + "expect(NetworkUtils.isCellular()).assertTrue()");
      expect(NetworkUtils.isCellular()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#6 assert ' + "expect(NetworkUtils.isBluetooth()).assertFalse()");
      expect(NetworkUtils.isBluetooth()).assertFalse();

      NetworkUtils.setNetworkType(NetworkType.BLUETOOTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#7 assert ' + "expect(NetworkUtils.isWifi()).assertFalse()");
      expect(NetworkUtils.isWifi()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#8 assert ' + "expect(NetworkUtils.isCellular()).assertFalse()");
      expect(NetworkUtils.isCellular()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#9 assert ' + "expect(NetworkUtils.isBluetooth()).assertTrue()");
      expect(NetworkUtils.isBluetooth()).assertTrue();

      NetworkUtils.setNetworkType(NetworkType.ETHERNET);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0003',
        '#10 assert ' +
        "expect(NetworkUtils.isWifi() || NetworkUtils.isCellular() || NetworkUtils.isBluetooth()).assertFalse()");
      expect(NetworkUtils.isWifi() || NetworkUtils.isCellular() || NetworkUtils.isBluetooth()).assertFalse();
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0003', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_0400
     * @tc.name: testNetworkUtils0004
     * @tc.desc: Publish the availability flag only for the connected network state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0004', 'begin');
      NetworkUtils.reset();
      NetworkUtils.setNetworkState(NetworkState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#1 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.CONNECTING)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#2 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();

      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#3 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.CONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#4 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertTrue()");
      expect(NetworkUtils.isNetworkAvailable()).assertTrue();

      NetworkUtils.setNetworkState(NetworkState.SUSPENDED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#5 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.SUSPENDED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.SUSPENDED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#6 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();

      NetworkUtils.setNetworkState(NetworkState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#7 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0004',
        '#8 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0004', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_0500
     * @tc.name: testNetworkUtils0005
     * @tc.desc: Change the network type and the network state without cross contamination.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0005', 'begin');
      NetworkUtils.reset();
      NetworkUtils.setNetworkType(NetworkType.BLUETOOTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0005',
        '#1 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);

      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0005',
        '#2 assert ' + "expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.BLUETOOTH)");
      expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.BLUETOOTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0005',
        '#3 assert ' + "expect(NetworkUtils.isBluetooth()).assertTrue()");
      expect(NetworkUtils.isBluetooth()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0005',
        '#4 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertTrue()");
      expect(NetworkUtils.isNetworkAvailable()).assertTrue();

      NetworkUtils.setNetworkType(NetworkType.WIFI);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0005',
        '#5 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.CONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0005',
        '#6 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertTrue()");
      expect(NetworkUtils.isNetworkAvailable()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0005',
        '#7 assert ' + "expect(NetworkUtils.isWifi()).assertTrue()");
      expect(NetworkUtils.isWifi()).assertTrue();
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0005', 'end');
    });

    // ==================== state state callback (6 cases) ====================

    /*
     * @tc.number: SUB_NETWORK_UTILS_0600
     * @tc.name: testNetworkUtils0006
     * @tc.desc: Deliver the current network type to the callback when the connection comes up.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0006', 'begin');
      NetworkUtils.reset();
      const recorder: RecordingNetworkCallback = new RecordingNetworkCallback();
      NetworkUtils.addCallback(recorder);
      NetworkUtils.setNetworkType(NetworkType.WIFI);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0006',
        '#1 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0006',
        '#2 ' + "recorder.availableTypes[0]" + ' = ' + JSON.stringify(recorder.availableTypes[0]));
      expect(recorder.availableTypes[0]).assertEqual(NetworkType.WIFI);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0006',
        '#3 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(0);

      NetworkUtils.setNetworkType(NetworkType.CELLULAR);
      NetworkUtils.setNetworkState(NetworkState.CONNECTING);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0006',
        '#4 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0006',
        '#5 ' + "recorder.availableTypes[1]" + ' = ' + JSON.stringify(recorder.availableTypes[1]));
      expect(recorder.availableTypes[1]).assertEqual(NetworkType.CELLULAR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0006',
        '#6 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(1);
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0006', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_0700
     * @tc.name: testNetworkUtils0007
     * @tc.desc: Report a lost connection for every state below the connected state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0007', 'begin');
      NetworkUtils.reset();
      const recorder: RecordingNetworkCallback = new RecordingNetworkCallback();
      NetworkUtils.addCallback(recorder);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      NetworkUtils.setNetworkState(NetworkState.DISCONNECTED);
      NetworkUtils.setNetworkState(NetworkState.CONNECTING);
      NetworkUtils.setNetworkState(NetworkState.SUSPENDED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0007',
        '#1 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0007',
        '#2 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0007',
        '#3 ' + "recorder.availableTypes[0]" + ' = ' + JSON.stringify(recorder.availableTypes[0]));
      expect(recorder.availableTypes[0]).assertEqual(NetworkType.UNKNOWN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0007',
        '#4 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.SUSPENDED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.SUSPENDED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0007',
        '#5 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0007', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_0800
     * @tc.name: testNetworkUtils0008
     * @tc.desc: Skip the notification when the requested state equals the current state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0008', 'begin');
      NetworkUtils.reset();
      const recorder: RecordingNetworkCallback = new RecordingNetworkCallback();
      NetworkUtils.addCallback(recorder);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0008',
        '#1 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0008',
        '#2 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(0);
      NetworkUtils.setNetworkState(NetworkState.DISCONNECTED);
      NetworkUtils.setNetworkState(NetworkState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0008',
        '#3 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0008',
        '#4 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0008',
        '#5 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0008', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_0900
     * @tc.name: testNetworkUtils0009
     * @tc.desc: Emit no callback at all while only the network type is being changed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0009', 'begin');
      NetworkUtils.reset();
      const recorder: RecordingNetworkCallback = new RecordingNetworkCallback();
      NetworkUtils.addCallback(recorder);
      NetworkUtils.setNetworkType(NetworkType.WIFI);
      NetworkUtils.setNetworkType(NetworkType.CELLULAR);
      NetworkUtils.setNetworkType(NetworkType.BLUETOOTH);
      NetworkUtils.setNetworkType(NetworkType.NONE);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0009',
        '#1 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0009',
        '#2 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0009',
        '#3 assert ' + "expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.NONE)");
      expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.NONE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0009',
        '#4 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0009',
        '#5 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0009',
        '#6 ' + "recorder.availableTypes[0]" + ' = ' + JSON.stringify(recorder.availableTypes[0]));
      expect(recorder.availableTypes[0]).assertEqual(NetworkType.NONE);
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0009', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_1000
     * @tc.name: testNetworkUtils0010
     * @tc.desc: Stop the delivery after removing a callback and ignore unknown callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0010', 'begin');
      NetworkUtils.reset();
      const recorder: RecordingNetworkCallback = new RecordingNetworkCallback();
      const stranger: RecordingNetworkCallback = new RecordingNetworkCallback();
      NetworkUtils.addCallback(recorder);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      NetworkUtils.removeCallback(recorder);
      NetworkUtils.removeCallback(recorder);
      NetworkUtils.removeCallback(stranger);
      NetworkUtils.setNetworkState(NetworkState.DISCONNECTED);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0010',
        '#1 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0010',
        '#2 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0010',
        '#3 ' + "stranger.availableTypes.length" + ' = ' + JSON.stringify(stranger.availableTypes.length));
      expect(stranger.availableTypes.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0010',
        '#4 ' + "stranger.lostCount" + ' = ' + JSON.stringify(stranger.lostCount));
      expect(stranger.lostCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0010',
        '#5 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertTrue()");
      expect(NetworkUtils.isNetworkAvailable()).assertTrue();
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0010', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_1100
     * @tc.name: testNetworkUtils0011
     * @tc.desc: Isolate a failing callback so the remaining subscribers are still notified.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0011', 'begin');
      NetworkUtils.reset();
      const throwing: ThrowingNetworkCallback = new ThrowingNetworkCallback();
      const survivor: RecordingNetworkCallback = new RecordingNetworkCallback();
      NetworkUtils.addCallback(throwing);
      NetworkUtils.addCallback(survivor);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      NetworkUtils.setNetworkState(NetworkState.DISCONNECTED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0011',
        '#1 ' + "survivor.availableTypes.length" + ' = ' + JSON.stringify(survivor.availableTypes.length));
      expect(survivor.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0011',
        '#2 ' + "survivor.lostCount" + ' = ' + JSON.stringify(survivor.lostCount));
      expect(survivor.lostCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0011',
        '#3 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0011',
        '#4 ' + "survivor.availableTypes[0]" + ' = ' + JSON.stringify(survivor.availableTypes[0]));
      expect(survivor.availableTypes[0]).assertEqual(NetworkType.UNKNOWN);
      NetworkUtils.removeCallback(throwing);
      NetworkUtils.removeCallback(survivor);
      NetworkUtils.reset();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0011', 'end');
    });

    // ==================== describe describe text and reset (3 cases) ====================

    /*
     * @tc.number: SUB_NETWORK_UTILS_1200
     * @tc.name: testNetworkUtils0012
     * @tc.desc: Label every network type with its display name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0012', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0012',
        '#1 assert ' + "expect(NetworkUtils.getNetworkTypeLabel(NetworkType.WIFI)).assertEqual('WiFi')");
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.WIFI)).assertEqual('WiFi');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0012',
        '#2 assert ' + "expect(NetworkUtils.getNetworkTypeLabel(NetworkType.CELLULAR)).assertEqual('Cellular')");
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.CELLULAR)).assertEqual('Cellular');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0012',
        '#3 assert ' + "expect(NetworkUtils.getNetworkTypeLabel(NetworkType.ETHERNET)).assertEqual('Ethernet')");
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.ETHERNET)).assertEqual('Ethernet');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0012',
        '#4 assert ' + "expect(NetworkUtils.getNetworkTypeLabel(NetworkType.BLUETOOTH)).assertEqual('Bluetooth')");
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.BLUETOOTH)).assertEqual('Bluetooth');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0012',
        '#5 assert ' + "expect(NetworkUtils.getNetworkTypeLabel(NetworkType.NONE)).assertEqual('None')");
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.NONE)).assertEqual('None');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0012',
        '#6 assert ' + "expect(NetworkUtils.getNetworkTypeLabel(NetworkType.UNKNOWN)).assertEqual('Unknown')");
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.UNKNOWN)).assertEqual('Unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0012',
        '#7 assert ' + "expect(NetworkUtils.getNetworkTypeLabel(NetworkType.WIFI).length).assertLarger(0)");
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.WIFI).length).assertLarger(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0012', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_1300
     * @tc.name: testNetworkUtils0013
     * @tc.desc: Label every network state with its display name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0013', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0013',
        '#1 assert ' + "expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED)).assertEqual('Connected')");
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED)).assertEqual('Connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0013',
        '#2 assert ' +
        "expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED)).assertEqual('Disconnected')");
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED)).assertEqual('Disconnected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0013',
        '#3 assert ' + "expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING)).assertEqual('Connecting')");
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING)).assertEqual('Connecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0013',
        '#4 assert ' + "expect(NetworkUtils.getNetworkStateLabel(NetworkState.SUSPENDED)).assertEqual('Suspended')");
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.SUSPENDED)).assertEqual('Suspended');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0013',
        '#5 assert ' +
        "expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED) === NetworkUtils.getNetworkStateLabel(Netw" +
        "orkState.SUSPENDED)).assertFalse()");
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED)
        === NetworkUtils.getNetworkStateLabel(NetworkState.SUSPENDED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0013',
        '#6 assert ' + "expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED).length).assertLarger(0)");
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED).length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0013',
        '#7 assert ' +
        "expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING).indexOf('nect') >= 0).assertTrue()");
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING).indexOf('nect') >= 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0013', 'end');
    });

    /*
     * @tc.number: SUB_NETWORK_UTILS_1400
     * @tc.name: testNetworkUtils0014
     * @tc.desc: Reset the helper so the type, the state and the subscribers all return to idle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0014', 'begin');
      NetworkUtils.reset();
      const recorder: RecordingNetworkCallback = new RecordingNetworkCallback();
      NetworkUtils.addCallback(recorder);
      NetworkUtils.setNetworkType(NetworkType.WIFI);
      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#1 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);

      NetworkUtils.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#2 assert ' + "expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.UNKNOWN)");
      expect(NetworkUtils.getNetworkType()).assertEqual(NetworkType.UNKNOWN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#3 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#4 assert ' + "expect(NetworkUtils.isNetworkAvailable()).assertFalse()");
      expect(NetworkUtils.isNetworkAvailable()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#5 assert ' + "expect(NetworkUtils.isWifi()).assertFalse()");
      expect(NetworkUtils.isWifi()).assertFalse();

      NetworkUtils.setNetworkState(NetworkState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#6 ' + "recorder.availableTypes.length" + ' = ' + JSON.stringify(recorder.availableTypes.length));
      expect(recorder.availableTypes.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#7 ' + "recorder.lostCount" + ' = ' + JSON.stringify(recorder.lostCount));
      expect(recorder.lostCount).assertEqual(0);
      NetworkUtils.reset();
      NetworkUtils.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testNetworkUtils0014',
        '#8 assert ' + "expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED)");
      expect(NetworkUtils.getNetworkState()).assertEqual(NetworkState.DISCONNECTED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testNetworkUtils0014', 'end');
    });
  });
}
