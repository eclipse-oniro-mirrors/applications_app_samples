/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// NetworkUtils 工具类测试套件
// ========================================

/**
 * NetworkUtils 工具类测试套件。
 * 测试 NetworkUtils 类中网络类型与状态标签获取、
 * 连接判断、带宽评估、信号等级计算、延迟估算等方法的正确性。
 */
export default function networkUtilsTest(): void {
  describe('NetworkUtilsTest', () => {

    // ========================================
    // getNetworkTypeLabel - 网络类型标签测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_0100
     * @tc.name testNetworkUtils0001
     * @tc.desc 正向: 类型标签 - WIFI 返回 "Wi-Fi"
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
     * @tc.desc 正向: 类型标签 - CELLULAR 返回 "蜂窝网络"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0002: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.CELLULAR);
      expect(result).assertEqual('蜂窝网络');
      expect(result.length).assertEqual(4);
      expect(result.indexOf('蜂窝')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0002: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0300
     * @tc.name testNetworkUtils0003
     * @tc.desc 正向: 类型标签 - ETHERNET 返回 "以太网"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0003: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.ETHERNET);
      expect(result).assertEqual('以太网');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('以太')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0003: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0400
     * @tc.name testNetworkUtils0004
     * @tc.desc 正向: 类型标签 - BLUETOOTH 返回 "蓝牙"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0004: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.BLUETOOTH);
      expect(result).assertEqual('蓝牙');
      expect(result.length).assertEqual(2);
      expect(NetworkType.BLUETOOTH).assertEqual('bluetooth');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0004: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0500
     * @tc.name testNetworkUtils0005
     * @tc.desc 正向: 类型标签 - UNKNOWN 返回 "未知网络"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0005: begin');
      const result: string = NetworkUtils.getNetworkTypeLabel(NetworkType.UNKNOWN);
      expect(result).assertEqual('未知网络');
      expect(result.length).assertEqual(4);
      expect(result.indexOf('未知')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0005: end');
    });

    // ========================================
    // getNetworkStateLabel - 网络状态标签测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_0600
     * @tc.name testNetworkUtils0006
     * @tc.desc 正向: 状态标签 - CONNECTED 返回 "已连接"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0006: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED);
      expect(result).assertEqual('已连接');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('已')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0006: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0700
     * @tc.name testNetworkUtils0007
     * @tc.desc 正向: 状态标签 - DISCONNECTED 返回 "已断开"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0007: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED);
      expect(result).assertEqual('已断开');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('断')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0007: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0800
     * @tc.name testNetworkUtils0008
     * @tc.desc 正向: 状态标签 - CONNECTING 返回 "连接中"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0008: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING);
      expect(result).assertEqual('连接中');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('中')).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0008: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_0900
     * @tc.name testNetworkUtils0009
     * @tc.desc 正向: 状态标签 - SUSPENDED 返回 "已暂停"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0009: begin');
      const result: string = NetworkUtils.getNetworkStateLabel(NetworkState.SUSPENDED);
      expect(result).assertEqual('已暂停');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('暂')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0009: end');
    });

    // ========================================
    // isConnected - 连接状态判断测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_1000
     * @tc.name testNetworkUtils0010
     * @tc.desc 正向: 连接判断 - CONNECTED 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0010: begin');
      const result: boolean = NetworkUtils.isConnected(NetworkState.CONNECTED);
      expect(result).assertTrue();
      expect(NetworkUtils.isAvailable(NetworkState.CONNECTED)).assertTrue();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTED)).assertEqual('已连接');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0010: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1100
     * @tc.name testNetworkUtils0011
     * @tc.desc 正向: 连接判断 - DISCONNECTED 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0011: begin');
      const result: boolean = NetworkUtils.isConnected(NetworkState.DISCONNECTED);
      expect(result).assertFalse();
      expect(NetworkUtils.isAvailable(NetworkState.DISCONNECTED)).assertFalse();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED)).assertEqual('已断开');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0011: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1200
     * @tc.name testNetworkUtils0012
     * @tc.desc 正向: 连接判断 - CONNECTING 返回 false
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
    // isAvailable - 网络可用性判断测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_1300
     * @tc.name testNetworkUtils0013
     * @tc.desc 正向: 可用性 - CONNECTED 返回 true
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
     * @tc.desc 正向: 可用性 - CONNECTING 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0014: begin');
      const result: boolean = NetworkUtils.isAvailable(NetworkState.CONNECTING);
      expect(result).assertTrue();
      expect(NetworkUtils.isConnected(NetworkState.CONNECTING)).assertFalse();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.CONNECTING)).assertEqual('连接中');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0014: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1500
     * @tc.name testNetworkUtils0015
     * @tc.desc 正向: 可用性 - DISCONNECTED 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0015: begin');
      const result: boolean = NetworkUtils.isAvailable(NetworkState.DISCONNECTED);
      expect(result).assertFalse();
      expect(NetworkUtils.isConnected(NetworkState.DISCONNECTED)).assertFalse();
      expect(NetworkUtils.getNetworkStateLabel(NetworkState.DISCONNECTED)).assertEqual('已断开');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0015: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1600
     * @tc.name testNetworkUtils0016
     * @tc.desc 正向: 可用性 - SUSPENDED 返回 false
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
    // isHighBandwidth - 高带宽判断测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_1700
     * @tc.name testNetworkUtils0017
     * @tc.desc 正向: 高带宽 - WIFI 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0017: begin');
      const result: boolean = NetworkUtils.isHighBandwidth(NetworkType.WIFI);
      expect(result).assertTrue();
      expect(NetworkUtils.getBandwidthDescription(NetworkType.WIFI)).assertEqual('百兆级带宽');
      expect(NetworkUtils.estimateLatency(NetworkType.WIFI)).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0017: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1800
     * @tc.name testNetworkUtils0018
     * @tc.desc 正向: 高带宽 - ETHERNET 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0018: begin');
      const result: boolean = NetworkUtils.isHighBandwidth(NetworkType.ETHERNET);
      expect(result).assertTrue();
      expect(NetworkUtils.getBandwidthDescription(NetworkType.ETHERNET)).assertEqual('千兆级带宽');
      expect(NetworkUtils.estimateLatency(NetworkType.ETHERNET)).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0018: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_1900
     * @tc.name testNetworkUtils0019
     * @tc.desc 正向: 高带宽 - CELLULAR 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0019: begin');
      const result: boolean = NetworkUtils.isHighBandwidth(NetworkType.CELLULAR);
      expect(result).assertFalse();
      expect(NetworkUtils.getNetworkTypeLabel(NetworkType.CELLULAR)).assertEqual('蜂窝网络');
      expect(NetworkUtils.isHighBandwidth(NetworkType.ETHERNET)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0019: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_2000
     * @tc.name testNetworkUtils0020
     * @tc.desc 正向: 高带宽 - BLUETOOTH 返回 false
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
    // getSignalLevel - 信号等级计算测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_2100
     * @tc.name testNetworkUtils0021
     * @tc.desc 正向: 信号等级 - 极好 (rssi >= -50)
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
     * @tc.desc 正向: 信号等级 - 好 (-60 <= rssi < -50)
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
     * @tc.desc 正向: 信号等级 - 一般 (-70 <= rssi < -60)
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
     * @tc.desc 正向: 信号等级 - 差 (-80 <= rssi < -70)
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
     * @tc.desc 正向: 信号等级 - 无信号 (rssi < -80)
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
     * @tc.desc 边界: 信号等级 - 临界值测试
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
    // estimateLatency - 延迟估算测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_2700
     * @tc.name testNetworkUtils0027
     * @tc.desc 正向: 延迟估算 - WIFI 返回 20ms
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
     * @tc.desc 正向: 延迟估算 - ETHERNET 返回 5ms
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
     * @tc.desc 正向: 延迟估算 - CELLULAR 返回 100ms
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
     * @tc.desc 正向: 延迟估算 - BLUETOOTH 返回 150ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0030', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0030: begin');
      const result: number = NetworkUtils.estimateLatency(NetworkType.BLUETOOTH);
      expect(result).assertEqual(150);
      expect(result).assertLarger(100);
      expect(NetworkUtils.getBandwidthDescription(NetworkType.BLUETOOTH)).assertEqual('低功耗窄带');
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0030: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3100
     * @tc.name testNetworkUtils0031
     * @tc.desc 正向: 延迟估算 - UNKNOWN 返回 200ms
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
     * @tc.desc 正向: 延迟估算 - 延迟递增顺序验证
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
    // getBandwidthDescription - 带宽描述测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_3300
     * @tc.name testNetworkUtils0033
     * @tc.desc 正向: 带宽描述 - ETHERNET 返回 "千兆级带宽"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0033', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0033: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.ETHERNET);
      expect(result).assertEqual('千兆级带宽');
      expect(result.length).assertEqual(5);
      expect(result.indexOf('千兆')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0033: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3400
     * @tc.name testNetworkUtils0034
     * @tc.desc 正向: 带宽描述 - WIFI 返回 "百兆级带宽"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0034', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0034: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.WIFI);
      expect(result).assertEqual('百兆级带宽');
      expect(result.length).assertEqual(5);
      expect(result.indexOf('百兆')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0034: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3500
     * @tc.name testNetworkUtils0035
     * @tc.desc 正向: 带宽描述 - CELLULAR 返回 "移动网络带宽"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0035', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0035: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.CELLULAR);
      expect(result).assertEqual('移动网络带宽');
      expect(result.length).assertEqual(6);
      expect(result.indexOf('移动')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0035: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3600
     * @tc.name testNetworkUtils0036
     * @tc.desc 正向: 带宽描述 - BLUETOOTH 返回 "低功耗窄带"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0036', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0036: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.BLUETOOTH);
      expect(result).assertEqual('低功耗窄带');
      expect(result.length).assertEqual(5);
      expect(result.indexOf('低功')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0036: end');
    });

    /**
     * @tc.number SUB_NETWORK_UTILS_3700
     * @tc.name testNetworkUtils0037
     * @tc.desc 正向: 带宽描述 - UNKNOWN 返回 "未知带宽"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNetworkUtils0037', 0, () => {
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0037: begin');
      const result: string = NetworkUtils.getBandwidthDescription(NetworkType.UNKNOWN);
      expect(result).assertEqual('未知带宽');
      expect(result.length).assertEqual(4);
      expect(result.indexOf('未知')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testNetworkUtils0037: end');
    });

    // ========================================
    // 枚举值测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_3800
     * @tc.name testNetworkUtils0038
     * @tc.desc 正向: 网络类型枚举值验证
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
     * @tc.desc 正向: 网络状态枚举值验证
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
    // 综合场景测试
    // ========================================

    /**
     * @tc.number SUB_NETWORK_UTILS_4000
     * @tc.name testNetworkUtils0040
     * @tc.desc 正向: 高带宽网络延迟较低综合验证
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
     * @tc.desc 正向: 信号等级递减顺序验证
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
     * @tc.desc 正向: 状态判断一致性验证
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
