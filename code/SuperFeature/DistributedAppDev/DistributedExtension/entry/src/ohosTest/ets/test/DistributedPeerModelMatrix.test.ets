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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { BT_PEER_LIMIT } from '../../../main/ets/common/AppConstants';
import { BleAdvertiser, BlePeer, BlePeerScanner } from '../../../main/ets/utils/BlePeerScanner';
import { BtPeer, BtPeerScanner } from '../../../main/ets/utils/BtPeerScanner';

/**
 * 对端候选列表的模型与扫描器空转路径：
 * 列表上每一行都由 BtPeer.label / BlePeer.label 拼出来，地址或信号强度漏掉会让用户选错设备；
 * 扫描器的"未开始时停止"必须是无害的空操作，否则页面销毁时会误报错误。
 */
export default function distributedPeerModelMatrixTest() {
  describe('DistributedBtPeerModelTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_0100
     * @tc.name testBtPeer0001
     * @tc.desc Verify a paired peer with a name renders name, separator and uppercase address.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBtPeer0001', 0, () => {
      const peer = new BtPeer('12:34:56:78:9A:BC', 'Watch 4', true);
      expect(peer.label()).assertEqual('Watch 4 · 12:34:56:78:9A:BC');
      expect(peer.label().includes('·')).assertTrue();
      expect(peer.addr).assertEqual('12:34:56:78:9A:BC');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_0200
     * @tc.name testBtPeer0002
     * @tc.desc Verify a peer without a name shows the placeholder instead of an empty prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBtPeer0002', 0, () => {
      const peer = new BtPeer('11:22:33:44:55:66', '', false);
      expect(peer.label()).assertEqual('（系统没给出名称） · 11:22:33:44:55:66');
      expect(peer.label().startsWith('（')).assertTrue();
      expect(peer.name).assertEqual('');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_0300
     * @tc.name testBtPeer0003
     * @tc.desc Verify the address source label distinguishes paired devices from fresh discoveries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBtPeer0003', 0, () => {
      expect(new BtPeer('12:34:56:78:9A:BC', 'A', true).sourceName()).assertEqual('已配对');
      expect(new BtPeer('12:34:56:78:9A:BC', 'A', false).sourceName()).assertEqual('本次发现');
      expect(new BtPeer('12:34:56:78:9A:BC', 'A', true).sourceName() === '本次发现').assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_0400
     * @tc.name testBtPeer0004
     * @tc.desc Verify a fresh scanner is idle with an empty candidate list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBtPeer0004', 0, () => {
      const scanner = new BtPeerScanner('PeerTest');
      expect(scanner.isFinding()).assertFalse();
      expect(scanner.list().length).assertEqual(0);
      expect(scanner.onUpdate === null).assertTrue();
      expect(scanner.onError === null).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_0500
     * @tc.name testBtPeer0005
     * @tc.desc Verify stopping a discovery that never started is a silent no-op.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBtPeer0005', 0, () => {
      const scanner = new BtPeerScanner('PeerTest');
      let errors = 0;
      scanner.onError = (code: number, message: string) => {
        errors++;
      };
      scanner.stopDiscovery();
      scanner.release();
      expect(errors).assertEqual(0);
      expect(scanner.isFinding()).assertFalse();
      expect(scanner.list().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_0600
     * @tc.name testBtPeer0006
     * @tc.desc Verify starting a discovery either reports finding or surfaces the system error code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBtPeer0006', 0, () => {
      const scanner = new BtPeerScanner('PeerTest');
      let errorCode = 0;
      let errorMessage = '';
      scanner.onError = (code: number, message: string) => {
        errorCode = code;
        errorMessage = message;
      };
      scanner.startDiscovery(BT_PEER_LIMIT);
      if (scanner.isFinding()) {
        expect(scanner.list().length <= BT_PEER_LIMIT).assertTrue();
        expect(errorCode).assertEqual(0);
      } else {
        // 未授予 ACCESS_BLUETOOTH 时系统会直接抛错，页面据此显示错误码
        expect(errorMessage.length > 0).assertTrue();
        expect(scanner.list().length).assertEqual(0);
      }
      scanner.stopDiscovery();
      expect(scanner.isFinding()).assertFalse();
    });
  });

  describe('DistributedBlePeerModelTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_1000
     * @tc.name testBlePeer0001
     * @tc.desc Verify the BLE row shows name, device id and signal strength in that order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlePeer0001', 0, () => {
      const peer = new BlePeer('12:34:56:78:9A:01', 'Phone', -60, true);
      expect(peer.label()).assertEqual('Phone · 12:34:56:78:9A:01 · RSSI -60');
      expect(peer.label().indexOf('Phone') < peer.label().indexOf('RSSI')).assertTrue();
      expect(peer.connectable).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_1100
     * @tc.name testBlePeer0002
     * @tc.desc Verify a nameless advertisement falls back to a placeholder while keeping the id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlePeer0002', 0, () => {
      const peer = new BlePeer('12:34:56:78:9A:02', '', -95, false);
      expect(peer.label()).assertEqual('（广播里没有名称） · 12:34:56:78:9A:02 · RSSI -95');
      expect(peer.label().includes('12:34:56:78:9A:02')).assertTrue();
      expect(peer.connectable).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_1200
     * @tc.name testBlePeer0003
     * @tc.desc Verify a fresh BLE scanner is idle with an empty list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlePeer0003', 0, () => {
      const scanner = new BlePeerScanner('PeerTest');
      expect(scanner.isScanning()).assertFalse();
      expect(scanner.list().length).assertEqual(0);
      expect(scanner.onUpdate === null).assertTrue();
      expect(scanner.onError === null).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_1300
     * @tc.name testBlePeer0004
     * @tc.desc Verify stopping a scan that never started does not call the system.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBlePeer0004', 0, () => {
      const scanner = new BlePeerScanner('PeerTest');
      let errors = 0;
      scanner.onError = (code: number, message: string) => {
        errors++;
      };
      scanner.stop();
      scanner.stop();
      expect(errors).assertEqual(0);
      expect(scanner.isScanning()).assertFalse();
      expect(scanner.list().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_1400
     * @tc.name testBlePeer0005
     * @tc.desc Verify a fresh advertiser is off and stopping it twice is harmless.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBlePeer0005', 0, () => {
      const advertiser = new BleAdvertiser('PeerTest');
      let callbacks = 0;
      advertiser.onStateChange = (advertising: boolean, code: number, message: string) => {
        callbacks++;
      };
      expect(advertiser.isAdvertising()).assertFalse();
      advertiser.stop();
      advertiser.stop();
      expect(callbacks).assertEqual(0);
      expect(advertiser.isAdvertising()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PEER_1500
     * @tc.name testBlePeer0006
     * @tc.desc Verify the candidate caps stay positive and small enough for one screen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBlePeer0006', 0, () => {
      expect(BT_PEER_LIMIT).assertEqual(8);
      expect(BT_PEER_LIMIT > 0).assertTrue();
      const scanner = new BlePeerScanner('PeerTest');
      expect(scanner.list().length < BT_PEER_LIMIT).assertTrue();
    });
  });
}
