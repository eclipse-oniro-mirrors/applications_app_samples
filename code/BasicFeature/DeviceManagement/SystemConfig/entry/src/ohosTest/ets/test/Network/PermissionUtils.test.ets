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
import { PermissionUtils, PermissionStatus, SystemConfigConstants } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// PermissionUtils 工具类测试套件
// ========================================

/**
 * PermissionUtils 工具类测试套件。
 * 测试 PermissionUtils 类中权限状态检查、权限标签获取、
 * 必要权限管理和权限列表格式化等方法的正确性。
 */
export default function permissionUtilsTest(): void {
  describe('PermissionUtilsTest', () => {

    // ========================================
    // checkPermissionStatus - 权限状态检查测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_0100
     * @tc.name testPermissionUtils0001
     * @tc.desc 正向: 未登记权限默认返回 NOT_DETERMINED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0001: begin');
      const testPerm: string = 'ohos.permission.INTERNET';
      const status1: PermissionStatus = PermissionUtils.checkPermissionStatus(testPerm);
      expect(status1).assertEqual(PermissionStatus.NOT_DETERMINED);
      expect(PermissionUtils.isPermissionGranted(status1)).assertFalse();
      expect(PermissionUtils.isPermissionRestricted(status1)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0001: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0200
     * @tc.name testPermissionUtils0002
     * @tc.desc 正向: 权限检查 - 未决定状态为默认
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0002: begin');
      const unknownPerm: string = 'ohos.permission.UNKNOWN_TEST_PERMISSION';
      const status: PermissionStatus = PermissionUtils.checkPermissionStatus(unknownPerm);
      expect(status).assertEqual(PermissionStatus.NOT_DETERMINED);
      expect(PermissionUtils.getPermissionStatusLabel(status)).assertEqual('未决定');
      expect(PermissionUtils.getPermissionLabel(unknownPerm)).assertEqual(unknownPerm);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0002: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0300
     * @tc.name testPermissionUtils0003
     * @tc.desc 正向: 模拟权限工具的 DND 权限默认未登记
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0003: begin');
      const dndPerm: string = SystemConfigConstants.PERMISSION_DND;
      const status: PermissionStatus = PermissionUtils.checkPermissionStatus(dndPerm);
      expect(status).assertEqual(PermissionStatus.NOT_DETERMINED);
      expect(PermissionUtils.isPermissionGranted(status)).assertFalse();
      expect(PermissionUtils.isPermissionRestricted(status)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0003: end');
    });

    // ========================================
    // isPermissionGranted - 判断是否已授予测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_0400
     * @tc.name testPermissionUtils0004
     * @tc.desc 正向: 判断已授予 - GRANTED 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0004: begin');
      const result: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.GRANTED);
      expect(result).assertTrue();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED)).assertEqual('已授予');
      expect(PermissionUtils.isPermissionRestricted(PermissionStatus.GRANTED)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0004: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0500
     * @tc.name testPermissionUtils0005
     * @tc.desc 正向: 判断已授予 - DENIED 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0005: begin');
      const result: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.DENIED);
      expect(result).assertFalse();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.DENIED)).assertEqual('已拒绝');
      expect(PermissionUtils.isPermissionRestricted(PermissionStatus.DENIED)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0005: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0600
     * @tc.name testPermissionUtils0006
     * @tc.desc 正向: 判断已授予 - NOT_DETERMINED 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0006: begin');
      const result1: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.NOT_DETERMINED);
      const result2: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.RESTRICTED);
      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result1).assertEqual(result2);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0006: end');
    });

    // ========================================
    // isPermissionRestricted - 判断是否受限测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_0700
     * @tc.name testPermissionUtils0007
     * @tc.desc 正向: 判断受限 - RESTRICTED 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0007: begin');
      const result: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.RESTRICTED);
      expect(result).assertTrue();
      expect(PermissionUtils.isPermissionGranted(PermissionStatus.RESTRICTED)).assertFalse();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.RESTRICTED)).assertEqual('受限');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0007: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0800
     * @tc.name testPermissionUtils0008
     * @tc.desc 正向: 判断受限 - GRANTED 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0008: begin');
      const result: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.GRANTED);
      expect(result).assertFalse();
      expect(PermissionUtils.isPermissionGranted(PermissionStatus.GRANTED)).assertTrue();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED)).assertEqual('已授予');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0008: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0900
     * @tc.name testPermissionUtils0009
     * @tc.desc 正向: 判断受限 - 其他状态返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0009: begin');
      const result1: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.DENIED);
      const result2: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.NOT_DETERMINED);
      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result1).assertEqual(result2);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0009: end');
    });

    // ========================================
    // getPermissionLabel - 获取权限标签测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_1000
     * @tc.name testPermissionUtils0010
     * @tc.desc 正向: 获取标签 - DND 权限返回中文描述
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0010: begin');
      const dndPerm: string = 'ohos.permission.GET_DONOTDISTURB_STATE';
      const result: string = PermissionUtils.getPermissionLabel(dndPerm);
      expect(result).assertEqual('免打扰状态查询');
      expect(result.length).assertLarger(0);
      expect(result.indexOf('免打扰')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0010: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1100
     * @tc.name testPermissionUtils0011
     * @tc.desc 正向: 获取标签 - INTERNET 权限返回中文描述
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0011: begin');
      const result: string = PermissionUtils.getPermissionLabel('ohos.permission.INTERNET');
      expect(result).assertEqual('网络访问');
      expect(result.length).assertEqual(4);
      expect(result.indexOf('网络')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0011: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1200
     * @tc.name testPermissionUtils0012
     * @tc.desc 正向: 获取标签 - 位置权限返回中文描述
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0012: begin');
      const result1: string = PermissionUtils.getPermissionLabel('ohos.permission.LOCATION');
      const result2: string = PermissionUtils.getPermissionLabel('ohos.permission.CAMERA');
      expect(result1).assertEqual('位置信息');
      expect(result2).assertEqual('相机使用');
      expect(result1.length).assertLarger(0);
      expect(result2.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0012: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1300
     * @tc.name testPermissionUtils0013
     * @tc.desc 边界: 获取标签 - 未知权限返回原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0013: begin');
      const unknownPerm: string = 'ohos.permission.UNKNOWN_PERM';
      const result: string = PermissionUtils.getPermissionLabel(unknownPerm);
      expect(result).assertEqual(unknownPerm);
      expect(result.length).assertEqual(unknownPerm.length);
      expect(result.indexOf('ohos.permission')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0013: end');
    });

    // ========================================
    // getPermissionStatusLabel - 获取权限状态标签测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_1400
     * @tc.name testPermissionUtils0014
     * @tc.desc 正向: 状态标签 - GRANTED 返回 "已授予"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0014: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED);
      expect(result).assertEqual('已授予');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('已')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0014: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1500
     * @tc.name testPermissionUtils0015
     * @tc.desc 正向: 状态标签 - DENIED 返回 "已拒绝"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0015: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.DENIED);
      expect(result).assertEqual('已拒绝');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('拒')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0015: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1600
     * @tc.name testPermissionUtils0016
     * @tc.desc 正向: 状态标签 - NOT_DETERMINED  "未决定"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0016: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.NOT_DETERMINED);
      expect(result).assertEqual('未决定');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('未')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0016: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1700
     * @tc.name testPermissionUtils0017
     * @tc.desc 正向: 状态标签 - RESTRICTED 返回 "受限"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0017: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.RESTRICTED);
      expect(result).assertEqual('受限');
      expect(result.length).assertEqual(2);
      expect(result.indexOf('限')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0017: end');
    });

    // ========================================
    // getRequiredPermissions - 获取必要权限测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_1800
     * @tc.name testPermissionUtils0018
     * @tc.desc 正向: 必要权限列表 - 包含 DND 权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0018: begin');
      const permissions: string[] = PermissionUtils.getRequiredPermissions();
      expect(permissions.length).assertEqual(1);
      expect(permissions[0]).assertEqual(SystemConfigConstants.PERMISSION_DND);
      expect(PermissionUtils.getPermissionLabel(permissions[0])).assertEqual('免打扰状态查询');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0018: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1900
     * @tc.name testPermissionUtils0019
     * @tc.desc 正向: 必要权限列表 - 每次调用返回独立副本
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0019: begin');
      const first: string[] = PermissionUtils.getRequiredPermissions();
      first.push('ohos.permission.CAMERA');
      expect(first.length).assertEqual(2);
      const second: string[] = PermissionUtils.getRequiredPermissions();
      expect(second.length).assertEqual(1);
      expect(second.includes('ohos.permission.CAMERA')).assertFalse();
      expect(PermissionUtils.formatPermissionList(second)).assertEqual('免打扰状态查询');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0019: end');
    });

    // ========================================
    // getAllKnownPermissions - 获取所有已知权限测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_2000
     * @tc.name testPermissionUtils0020
     * @tc.desc 正向: 所有已知权限 - 返回完整列表
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0020', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0020: begin');
      const permissions: string[] = PermissionUtils.getAllKnownPermissions();
      expect(permissions.length).assertEqual(25);
      expect(permissions[0]).assertEqual(SystemConfigConstants.PERMISSION_DND);
      expect(permissions.includes('ohos.permission.INTERNET')).assertTrue();
      expect(PermissionUtils.getPermissionLabel(permissions[0])).assertEqual('免打扰状态查询');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0020: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2100
     * @tc.name testPermissionUtils0021
     * @tc.desc 正向: 所有已知权限 - 包含常见权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0021', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0021: begin');
      const permissions: string[] = PermissionUtils.getAllKnownPermissions();
      expect(permissions.includes('ohos.permission.CAMERA')).assertTrue();
      expect(permissions.includes('ohos.permission.LOCATION')).assertTrue();
      expect(permissions.includes('ohos.permission.MICROPHONE')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0021: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2200
     * @tc.name testPermissionUtils0022
     * @tc.desc 正向: 所有已知权限 - 前缀统一且均有中文标签
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0022', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0022: begin');
      const permissions: string[] = PermissionUtils.getAllKnownPermissions();
      let allPrefixed: boolean = true;
      let allMapped: boolean = true;
      for (const perm of permissions) {
        if (perm.indexOf('ohos.permission.') !== 0) {
          allPrefixed = false;
        }
        if (PermissionUtils.getPermissionLabel(perm) === perm) {
          allMapped = false;
        }
      }
      expect(allPrefixed).assertTrue();
      expect(allMapped).assertTrue();
      const uniquePerms: Set<string> = new Set<string>(permissions);
      expect(uniquePerms.size).assertEqual(permissions.length);
      expect(permissions[0].indexOf('ohos.permission')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0022: end');
    });

    // ========================================
    // formatPermissionList - 格式化权限列表测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_2300
     * @tc.name testPermissionUtils0023
     * @tc.desc 边界: 格式化 - 空列表返回 "无权限"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0023', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0023: begin');
      const result: string = PermissionUtils.formatPermissionList([]);
      expect(result).assertEqual('无权限');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('无')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0023: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2400
     * @tc.name testPermissionUtils0024
     * @tc.desc 正向: 格式化 - 单权限返回中文标签
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0024', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0024: begin');
      const result: string = PermissionUtils.formatPermissionList(['ohos.permission.INTERNET']);
      expect(result).assertEqual('网络访问');
      expect(result.length).assertEqual(4);
      expect(result.indexOf('、')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0024: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2500
     * @tc.name testPermissionUtils0025
     * @tc.desc 正向: 格式化 - 多权限顿号分隔
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0025', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0025: begin');
      const perms: string[] = ['ohos.permission.INTERNET', 'ohos.permission.LOCATION'];
      const result: string = PermissionUtils.formatPermissionList(perms);
      expect(result.indexOf('、')).assertLarger(-1);
      expect(result.indexOf('网络访问')).assertLarger(-1);
      expect(result.indexOf('位置信息')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0025: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2600
     * @tc.name testPermissionUtils0026
     * @tc.desc 正向: 格式化 - 三个权限正确分隔
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0026', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0026: begin');
      const perms: string[] = [
        'ohos.permission.INTERNET',
        'ohos.permission.CAMERA',
        'ohos.permission.LOCATION'
      ];
      const result: string = PermissionUtils.formatPermissionList(perms);
      expect(result.indexOf('网络访问')).assertLarger(-1);
      expect(result.indexOf('相机使用')).assertLarger(-1);
      expect(result.indexOf('位置信息')).assertLarger(-1);
      const separatorCount: number = result.split('、').length - 1;
      expect(separatorCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0026: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2700
     * @tc.name testPermissionUtils0027
     * @tc.desc 边界: 格式化 - 未知权限返回原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0027', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0027: begin');
      const perms: string[] = ['ohos.permission.UNKNOWN_PERM'];
      const result: string = PermissionUtils.formatPermissionList(perms);
      expect(result).assertEqual('ohos.permission.UNKNOWN_PERM');
      expect(result.length).assertLarger(0);
      expect(result.indexOf('UNKNOWN')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0027: end');
    });

    // ========================================
    // PermissionStatus 枚举测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_2800
     * @tc.name testPermissionUtils0028
     * @tc.desc 正向: 权限状态枚举值验证
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0028', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0028: begin');
      expect(PermissionStatus.GRANTED).assertEqual('granted');
      expect(PermissionStatus.DENIED).assertEqual('denied');
      expect(PermissionStatus.NOT_DETERMINED).assertEqual('not_determined');
      expect(PermissionStatus.RESTRICTED).assertEqual('restricted');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0028: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2900
     * @tc.name testPermissionUtils0029
     * @tc.desc 正向: 权限状态枚举唯一性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0029', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0029: begin');
      const statuses: PermissionStatus[] = [
        PermissionStatus.GRANTED,
        PermissionStatus.DENIED,
        PermissionStatus.NOT_DETERMINED,
        PermissionStatus.RESTRICTED
      ];
      const uniqueSet: Set<string> = new Set(statuses);
      expect(uniqueSet.size).assertEqual(4);
      expect(statuses.length).assertEqual(4);
      expect(uniqueSet.size).assertEqual(statuses.length);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0029: end');
    });

    // ========================================
    // 综合场景测试
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_3000
     * @tc.name testPermissionUtils0030
     * @tc.desc 正向: 权限状态一致性 - GRANTED 与 isGranted 匹配
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0030', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0030: begin');
      const isGranted: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.GRANTED);
      const isNotGranted1: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.DENIED);
      const isNotGranted2: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.NOT_DETERMINED);
      expect(isGranted).assertTrue();
      expect(isNotGranted1).assertFalse();
      expect(isNotGranted2).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0030: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3100
     * @tc.name testPermissionUtils0031
     * @tc.desc 正向: 权限状态一致性 - RESTRICTED 与 isRestricted 匹配
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0031', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0031: begin');
      const isRestricted: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.RESTRICTED);
      const isNotRestricted1: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.GRANTED);
      const isNotRestricted2: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.DENIED);
      expect(isRestricted).assertTrue();
      expect(isNotRestricted1).assertFalse();
      expect(isNotRestricted2).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0031: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3200
     * @tc.name testPermissionUtils0032
     * @tc.desc 正向: 权限标签映射 - 已知权限都有中文标签
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0032', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0032: begin');
      const allPerms: string[] = PermissionUtils.getAllKnownPermissions();
      let mappedCount: number = 0;
      for (const perm of allPerms) {
        const label: string = PermissionUtils.getPermissionLabel(perm);
        if (label !== perm) {
          mappedCount++;
        }
      }
      expect(mappedCount).assertLarger(10);
      expect(allPerms.length).assertLargerOrEqual(mappedCount);
      expect(mappedCount).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0032: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3300
     * @tc.name testPermissionUtils0033
     * @tc.desc 正向: 各状态标签完整性验证
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0033', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0033: begin');
      const grantedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED);
      const deniedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.DENIED);
      const notDeterminedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.NOT_DETERMINED);
      const restrictedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.RESTRICTED);
      expect(grantedLabel).assertEqual('已授予');
      expect(deniedLabel).assertEqual('已拒绝');
      expect(notDeterminedLabel).assertEqual('未决定');
      expect(restrictedLabel).assertEqual('受限');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0033: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3400
     * @tc.name testPermissionUtils0034
     * @tc.desc 正向: 必要权限在已知权限列表中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0034', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0034: begin');
      const required: string[] = PermissionUtils.getRequiredPermissions();
      const allKnown: string[] = PermissionUtils.getAllKnownPermissions();
      let allIncluded: boolean = true;
      for (const req of required) {
        if (!allKnown.includes(req)) {
          allIncluded = false;
          break;
        }
      }
      expect(allIncluded).assertTrue();
      expect(required.length).assertLarger(0);
      expect(allKnown.length).assertLarger(required.length);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0034: end');
    });
  });
}
