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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NetworkUtils, NetworkType, NetworkState } from 'library';
import { TestRes } from '../Utils/TestRes';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// NetworkUtils utility test suite
// ========================================

/**
 * NetworkUtils utility test suite.
 * Tests the correctness of network type and state label lookup,
 * connection checks, bandwidth evaluation, signal level calculation and latency estimation in the NetworkUtils class.
 */
export default function networkUtilsTest(): void {
  describe('NetworkUtilsTest', () => {

    // ========================================
    // getNetworkTypeLabel - network type label tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_0100
     * @tc.name testNetworkUtils0001
     * @tc.desc Verify type label - WIFI returns "Wi-Fi"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0001: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.WIFI);
      expect(result).assertEqual('Wi-Fi');
      expect(result.length).assertEqual(5);
      expect(result.indexOf('Wi')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0001: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0200
     * @tc.name testNetworkUtils0002
     * @tc.desc Verify type label - CELLULAR returns the cellular network label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0002: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.CELLULAR);
      expect(result).assertEqual(TestRes.str('net_type_cellular'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0002: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0300
     * @tc.name testNetworkUtils0003
     * @tc.desc Verify type label - ETHERNET returns the ethernet label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0003: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.ETHERNET);
      expect(result).assertEqual(TestRes.str('net_type_ethernet'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0003: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0400
     * @tc.name testNetworkUtils0004
     * @tc.desc Verify type label - BLUETOOTH returns the bluetooth label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0004: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.BLUETOOTH);
      expect(result).assertEqual(TestRes.str('net_type_bluetooth'));
      expect(result.length).assertLarger(0);
      expect(NetworkType.BLUETOOTH).assertEqual('bluetooth');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0004: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0500
     * @tc.name testNetworkUtils0005
     * @tc.desc Verify type label - UNKNOWN returns the unknown network label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0005: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.UNKNOWN);
      expect(result).assertEqual(TestRes.str('net_type_unknown'));
      expect(result.length).assertLarger(0);
      expect(result.indexOf(TestRes.str('status_unknown'))).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0005: end');
    });

    // ========================================
    // getNetworkStateLabel - network state label tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_0600
     * @tc.name testNetworkUtils0006
     * @tc.desc Verify state label - CONNECTED returns the connected label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0006: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED);
      expect(result).assertEqual(TestRes.str('net_state_connected'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0006: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0700
     * @tc.name testNetworkUtils0007
     * @tc.desc Verify state label - DISCONNECTED returns the disconnected label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0007: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED);
      expect(result).assertEqual(TestRes.str('net_state_disconnected'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0007: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0800
     * @tc.name testNetworkUtils0008
     * @tc.desc Verify state label - CONNECTING returns the connecting label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0008: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING);
      expect(result).assertEqual(TestRes.str('net_state_connecting'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0008: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0900
     * @tc.name testNetworkUtils0009
     * @tc.desc Verify state label - SUSPENDED returns the suspended label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0009: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.SUSPENDED);
      expect(result).assertEqual(TestRes.str('net_state_suspended'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0009: end');
    });

    // ========================================
    // isConnected - connection state tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_1000
     * @tc.name testNetworkUtils0010
     * @tc.desc Verify connection check - CONNECTED returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0010: begin');
      const result: boolean = NetworkUtils.isConnected(NetworkState.CONNECTED);
      expect(result).assertTrue();
      expect(NetworkUtils.isAvailable(NetworkState.CONNECTED)).assertTrue();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED)).assertEqual(TestRes.str('net_state_connected'));
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0010: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1100
     * @tc.name testNetworkUtils0011
     * @tc.desc Verify connection check - DISCONNECTED returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0011: begin');
      const result: boolean = NetworkUtils.isConnected(NetworkState.DISCONNECTED);
      expect(result).assertFalse();
      expect(NetworkUtils.isAvailable(NetworkState.DISCONNECTED)).assertFalse();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED))
        .assertEqual(TestRes.str('net_state_disconnected'));
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0011: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1200
     * @tc.name testNetworkUtils0012
     * @tc.desc Verify connection check - CONNECTING returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0012: begin');
      const result: boolean = NetworkUtils.isConnected(NetworkState.CONNECTING);
      expect(result).assertFalse();
      expect(result).assertEqual(false);
      expect(NetworkUtils.isConnected(NetworkState.SUSPENDED)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0012: end');
    });

    // ========================================
    // isAvailable - network availability tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_1300
     * @tc.name testNetworkUtils0013
     * @tc.desc Verify availability - CONNECTED returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0013: begin');
      const result: boolean = NetworkUtils.isAvailable(NetworkState.CONNECTED);
      expect(result).assertTrue();
      expect(NetworkUtils.isConnected(NetworkState.CONNECTED)).assertTrue();
      expect(NetworkUtils.isAvailable(NetworkState.SUSPENDED)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0013: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1400
     * @tc.name testNetworkUtils0014
     * @tc.desc Verify availability - CONNECTING returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0014: begin');
      const result: boolean = NetworkUtils.isAvailable(NetworkState.CONNECTING);
      expect(result).assertTrue();
      expect(NetworkUtils.isConnected(NetworkState.CONNECTING)).assertFalse();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING))
        .assertEqual(TestRes.str('net_state_connecting'));
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0014: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1500
     * @tc.name testNetworkUtils0015
     * @tc.desc Verify availability - DISCONNECTED returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0015: begin');
      const result: boolean = NetworkUtils.isAvailable(NetworkState.DISCONNECTED);
      expect(result).assertFalse();
      expect(NetworkUtils.isConnected(NetworkState.DISCONNECTED)).assertFalse();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED))
        .assertEqual(TestRes.str('net_state_disconnected'));
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0015: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1600
     * @tc.name testNetworkUtils0016
     * @tc.desc Verify availability - SUSPENDED returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0016: begin');
      const result: boolean = NetworkUtils.isAvailable(NetworkState.SUSPENDED);
      expect(result).assertFalse();
      expect(result).assertEqual(false);
      expect(NetworkUtils.isAvailable(NetworkState.DISCONNECTED)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0016: end');
    });

    // ========================================
    // isHighBandwidth - high bandwidth tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_1700
     * @tc.name testNetworkUtils0017
     * @tc.desc Verify high bandwidth - WIFI returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0017: begin');
      const result: boolean = NetworkUtils.isHighBandwidth(NetworkType.WIFI);
      expect(result).assertTrue();
      expect(NetworkUtils.getBandwidthDescription(NetworkType.WIFI)).assertEqual(TestRes.str('net_bw_megabit'));
      expect(NetworkUtils.estimateLatency(NetworkType.WIFI)).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0017: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1800
     * @tc.name testNetworkUtils0018
     * @tc.desc Verify high bandwidth - ETHERNET returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0018: begin');
      const result: boolean = NetworkUtils.isHighBandwidth(NetworkType.ETHERNET);
      expect(result).assertTrue();
      expect(NetworkUtils.getBandwidthDescription(NetworkType.ETHERNET)).assertEqual(TestRes.str('net_bw_gigabit'));
      expect(NetworkUtils.estimateLatency(NetworkType.ETHERNET)).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0018: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1900
     * @tc.name testNetworkUtils0019
     * @tc.desc Verify high bandwidth - CELLULAR returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0019: begin');
      const result: boolean = NetworkUtils.isHighBandwidth(NetworkType.CELLULAR);
      expect(result).assertFalse();
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.CELLULAR)).assertEqual(TestRes.str('net_type_cellular'));
      expect(NetworkUtils.isHighBandwidth(NetworkType.ETHERNET)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0019: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2000
     * @tc.name testNetworkUtils0020
     * @tc.desc Verify high bandwidth - BLUETOOTH returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0020', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0020: begin');
      const result: boolean = NetworkUtils.isHighBandwidth(NetworkType.BLUETOOTH);
      expect(result).assertFalse();
      expect(result).assertEqual(false);
      expect(NetworkUtils.isHighBandwidth(NetworkType.UNKNOWN)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0020: end');
    });

    // ========================================
    // getSignalLevel - signal level tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_2100
     * @tc.name testNetworkUtils0021
     * @tc.desc Verify signal level - excellent (rssi >= -50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0021', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0021: begin');
      expect(NetworkUtils.getSignalLevel(-40)).assertEqual(4);
      expect(NetworkUtils.getSignalLevel(-50)).assertEqual(4);
      expect(NetworkUtils.getSignalLevel(0)).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0021: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2200
     * @tc.name testNetworkUtils0022
     * @tc.desc Verify signal level - good (-60 <= rssi < -50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0022', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0022: begin');
      expect(NetworkUtils.getSignalLevel(-51)).assertEqual(3);
      expect(NetworkUtils.getSignalLevel(-55)).assertEqual(3);
      expect(NetworkUtils.getSignalLevel(-60)).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0022: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2300
     * @tc.name testNetworkUtils0023
     * @tc.desc Verify signal level - fair (-70 <= rssi < -60)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0023', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0023: begin');
      expect(NetworkUtils.getSignalLevel(-61)).assertEqual(2);
      expect(NetworkUtils.getSignalLevel(-65)).assertEqual(2);
      expect(NetworkUtils.getSignalLevel(-70)).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0023: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2400
     * @tc.name testNetworkUtils0024
     * @tc.desc Verify signal level - poor (-80 <= rssi < -70)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0024', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0024: begin');
      expect(NetworkUtils.getSignalLevel(-71)).assertEqual(1);
      expect(NetworkUtils.getSignalLevel(-75)).assertEqual(1);
      expect(NetworkUtils.getSignalLevel(-80)).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0024: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2500
     * @tc.name testNetworkUtils0025
     * @tc.desc Verify signal level - no signal (rssi < -80)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0025', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0025: begin');
      expect(NetworkUtils.getSignalLevel(-81)).assertEqual(0);
      expect(NetworkUtils.getSignalLevel(-90)).assertEqual(0);
      expect(NetworkUtils.getSignalLevel(-100)).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0025: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2600
     * @tc.name testNetworkUtils0026
     * @tc.desc Verify signal level - threshold boundary test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0026', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0026: begin');
      expect(NetworkUtils.getSignalLevel(-50)).assertEqual(4);
      expect(NetworkUtils.getSignalLevel(-60)).assertEqual(3);
      expect(NetworkUtils.getSignalLevel(-70)).assertEqual(2);
      expect(NetworkUtils.getSignalLevel(-80)).assertEqual(1);
      expect(NetworkUtils.getSignalLevel(-81)).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0026: end');
    });

    // ========================================
    // estimateLatency - latency estimation tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_2700
     * @tc.name testNetworkUtils0027
     * @tc.desc Verify latency estimation - WIFI returns 20ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0027', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0027: begin');
      const result: number = NetworkUtils.estimateLatency(NetworkType.WIFI);
      expect(result).assertEqual(20);
      expect(result).assertLarger(NetworkUtils.estimateLatency(NetworkType.ETHERNET));
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.WIFI)).assertEqual('Wi-Fi');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0027: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2800
     * @tc.name testNetworkUtils0028
     * @tc.desc Verify latency estimation - ETHERNET returns 5ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0028', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0028: begin');
      const result: number = NetworkUtils.estimateLatency(NetworkType.ETHERNET);
      expect(result).assertEqual(5);
      expect(result).assertLarger(0);
      expect(NetworkUtils.estimateLatency(NetworkType.UNKNOWN)).assertLarger(result);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0028: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2900
     * @tc.name testNetworkUtils0029
     * @tc.desc Verify latency estimation - CELLULAR returns 100ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0029', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0029: begin');
      const result: number = NetworkUtils.estimateLatency(NetworkType.CELLULAR);
      expect(result).assertEqual(100);
      expect(result).assertLarger(20);
      expect(NetworkUtils.isHighBandwidth(NetworkType.CELLULAR)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0029: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3000
     * @tc.name testNetworkUtils0030
     * @tc.desc Verify latency estimation - BLUETOOTH returns 150ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0030', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0030: begin');
      const result: number = NetworkUtils.estimateLatency(NetworkType.BLUETOOTH);
      expect(result).assertEqual(150);
      expect(result).assertLarger(100);
      expect(NetworkUtils.getBandwidthDescription(NetworkType.BLUETOOTH)).assertEqual(TestRes.str('net_bw_low_power'));
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0030: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3100
     * @tc.name testNetworkUtils0031
     * @tc.desc Verify latency estimation - UNKNOWN returns 200ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0031', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0031: begin');
      const result: number = NetworkUtils.estimateLatency(NetworkType.UNKNOWN);
      expect(result).assertEqual(200);
      expect(result).assertLarger(150);
      expect(NetworkUtils.isHighBandwidth(NetworkType.UNKNOWN)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0031: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3200
     * @tc.name testNetworkUtils0032
     * @tc.desc Verify latency estimation - latency ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0032', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0032: begin');
      const ethernet: number = NetworkUtils.estimateLatency(NetworkType.ETHERNET);
      const wifi: number = NetworkUtils.estimateLatency(NetworkType.WIFI);
      const cellular: number = NetworkUtils.estimateLatency(NetworkType.CELLULAR);
      const bluetooth: number = NetworkUtils.estimateLatency(NetworkType.BLUETOOTH);
      expect(ethernet).assertLarger(0);
      expect(wifi).assertLarger(ethernet);
      expect(cellular).assertLarger(wifi);
      expect(bluetooth).assertLarger(cellular);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0032: end');
    });

    // ========================================
    // getBandwidthDescription - bandwidth description tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_3300
     * @tc.name testNetworkUtils0033
     * @tc.desc Verify bandwidth description - ETHERNET returns the gigabit-level bandwidth label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0033', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0033: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.ETHERNET);
      expect(result).assertEqual(TestRes.str('net_bw_gigabit'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0033: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3400
     * @tc.name testNetworkUtils0034
     * @tc.desc Verify bandwidth description - WIFI returns the hundred-megabit-level bandwidth label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0034', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0034: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.WIFI);
      expect(result).assertEqual(TestRes.str('net_bw_megabit'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0034: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3500
     * @tc.name testNetworkUtils0035
     * @tc.desc Verify bandwidth description - CELLULAR returns the mobile network bandwidth label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0035', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0035: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.CELLULAR);
      expect(result).assertEqual(TestRes.str('net_bw_mobile'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0035: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3600
     * @tc.name testNetworkUtils0036
     * @tc.desc Verify bandwidth description - BLUETOOTH returns the low-power narrowband label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0036', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0036: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.BLUETOOTH);
      expect(result).assertEqual(TestRes.str('net_bw_low_power'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0036: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3700
     * @tc.name testNetworkUtils0037
     * @tc.desc Verify bandwidth description - UNKNOWN returns the unknown bandwidth label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0037', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0037: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.UNKNOWN);
      expect(result).assertEqual(TestRes.str('net_bw_unknown'));
      expect(result.length).assertLarger(0);
      expect(result.indexOf(TestRes.str('status_unknown'))).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0037: end');
    });

    // ========================================
    // Enum value tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_3800
     * @tc.name testNetworkUtils0038
     * @tc.desc Verify network type enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0038', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0038: begin');
      expect(NetworkType.WIFI).assertEqual('wifi');
      expect(NetworkType.CELLULAR).assertEqual('cellular');
      expect(NetworkType.ETHERNET).assertEqual('ethernet');
      expect(NetworkType.BLUETOOTH).assertEqual('bluetooth');
      expect(NetworkType.UNKNOWN).assertEqual('unknown');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0038: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3900
     * @tc.name testNetworkUtils0039
     * @tc.desc Verify network state enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0039', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0039: begin');
      expect(NetworkState.CONNECTED).assertEqual('connected');
      expect(NetworkState.DISCONNECTED).assertEqual('disconnected');
      expect(NetworkState.CONNECTING).assertEqual('connecting');
      expect(NetworkState.SUSPENDED).assertEqual('suspended');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0039: end');
    });

    // ========================================
    // Combined scenario tests
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_4000
     * @tc.name testNetworkUtils0040
     * @tc.desc Verify high bandwidth networks have lower latency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0040', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0040: begin');
      const wifiHighBw: boolean = NetworkUtils.isHighBandwidth(NetworkType.WIFI);
      const wifiLatency: number = NetworkUtils.estimateLatency(NetworkType.WIFI);
      const ethHighBw: boolean = NetworkUtils.isHighBandwidth(NetworkType.ETHERNET);
      const ethLatency: number = NetworkUtils.estimateLatency(NetworkType.ETHERNET);
      expect(wifiHighBw).assertTrue();
      expect(ethHighBw).assertTrue();
      expect(wifiLatency).assertLarger(0);
      expect(ethLatency).assertLarger(0);
      expect(ethLatency).assertLess(wifiLatency);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0040: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_4100
     * @tc.name testNetworkUtils0041
     * @tc.desc Verify signal level descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0041', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0041: begin');
      const level4: number = NetworkUtils.getSignalLevel(-40);
      const level3: number = NetworkUtils.getSignalLevel(-55);
      const level2: number = NetworkUtils.getSignalLevel(-65);
      const level1: number = NetworkUtils.getSignalLevel(-75);
      const level0: number = NetworkUtils.getSignalLevel(-90);
      expect(level4).assertEqual(4);
      expect(level3).assertEqual(3);
      expect(level2).assertEqual(2);
      expect(level1).assertEqual(1);
      expect(level0).assertEqual(0);
      expect(level4).assertLarger(level3);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0041: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_4200
     * @tc.name testNetworkUtils0042
     * @tc.desc Verify state check consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNetworkUtils0042', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0042: begin');
      const connected: boolean = NetworkUtils.isConnected(NetworkState.CONNECTED);
      const available: boolean = NetworkUtils.isAvailable(NetworkState.CONNECTED);
      expect(connected).assertTrue();
      expect(available).assertTrue();
      const disconnected: boolean = NetworkUtils.isConnected(NetworkState.DISCONNECTED);
      const notAvailable: boolean = NetworkUtils.isAvailable(NetworkState.DISCONNECTED);
      expect(disconnected).assertFalse();
      expect(notAvailable).assertFalse();
      expect(connected === disconnected).assertFalse();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0042: end');
    });
  });
}
