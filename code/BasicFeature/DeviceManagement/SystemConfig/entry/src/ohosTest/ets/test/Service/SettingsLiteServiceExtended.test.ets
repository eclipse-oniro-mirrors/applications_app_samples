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
import {
  SettingsLiteService,
  SettingsItemModel,
  SettingsOperationStatus
} from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * 模拟一次打开设置页面操作（与 Service 内部流程一致）。
 */
function simulateOpenPage(model: SettingsItemModel): void {
  model.markOpening();
  model.markSuccess('页面已打开');
}

/**
 * SettingsLiteService 扩展测试套件。
 * 补充覆盖并发操作 / 状态流转 / 异常恢复 / 边界值 / 长时间运行等场景。
 * 打开页面需要 UIAbilityContext，单元测试通过模型协同模拟操作流程。
 */
export default function SettingsLiteServiceExtendedTest(): void {
  describe('SettingsLiteServiceExtendedTest', () => {

    // ========================================
    // 并发操作测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0100
     * @tc.name testSettingsLiteServiceExtended0001
     * @tc.desc 正向: 连续模拟打开 PIN 设置后模型状态正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0001: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      const model: SettingsItemModel = service.getPinModel();
      for (let i: number = 0; i < 5; i++) {
        simulateOpenPage(model);
      }

      expect(model.operationCount).assertEqual(5);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.isSuccess()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0200
     * @tc.name testSettingsLiteServiceExtended0002
     * @tc.desc 正向: 连续模拟打开 NFC 设置后模型状态正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0002: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      const model: SettingsItemModel = service.getNfcModel();
      for (let i: number = 0; i < 5; i++) {
        simulateOpenPage(model);
      }

      expect(model.operationCount).assertEqual(5);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.isSuccess()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0300
     * @tc.name testSettingsLiteServiceExtended0003
     * @tc.desc 正向: 连续模拟打开双击设置后模型状态正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0003: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      const model: SettingsItemModel = service.getDoubleClickModel();
      for (let i: number = 0; i < 5; i++) {
        simulateOpenPage(model);
      }

      expect(model.operationCount).assertEqual(5);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.isSuccess()).assertTrue();
      service.destroy();
    });

    // ========================================
    // 状态流转测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0400
     * @tc.name testSettingsLiteServiceExtended0004
     * @tc.desc 正向: IDLE → OPENING → SUCCESS 完整流转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteServiceExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0004: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      const model: SettingsItemModel = service.getPinModel();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);

      model.markOpening();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.OPENING);
      expect(model.isOpening()).assertTrue();

      model.markSuccess('PIN 设置页面已打开');
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.isSuccess()).assertTrue();

      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0500
     * @tc.name testSettingsLiteServiceExtended0005
     * @tc.desc 边界: 重置后状态回到 IDLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0005: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      simulateOpenPage(service.getPinModel());
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);

      service.reset();
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(service.getPinModel().operationCount).assertEqual(0);
      expect(service.isServiceInitialized()).assertFalse();
    });

    // ========================================
    // 异常恢复测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0600
     * @tc.name testSettingsLiteServiceExtended0006
     * @tc.desc 边界: 未初始化直接操作模型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0006: begin');
      const service: SettingsLiteService = new SettingsLiteService();

      expect(service.isServiceInitialized()).assertFalse();

      const model: SettingsItemModel = service.getPinModel();
      simulateOpenPage(model);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.operationCount).assertEqual(1);
      expect(model.isSuccess()).assertTrue();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0700
     * @tc.name testSettingsLiteServiceExtended0007
     * @tc.desc 边界: 销毁后重新初始化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0007: begin');
      const service: SettingsLiteService = new SettingsLiteService();

      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();

      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();

      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();

      simulateOpenPage(service.getPinModel());
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(service.getPinModel().operationCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0800
     * @tc.name testSettingsLiteServiceExtended0008
     * @tc.desc 边界: 多次销毁不报错
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0008: begin');
      const service: SettingsLiteService = new SettingsLiteService();

      service.initialize();
      service.destroy();
      service.destroy();
      service.destroy();

      expect(service.isServiceInitialized()).assertFalse();
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(service.getPinModel().operationCount).assertEqual(0);
    });

    // ========================================
    // 边界值测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_0900
     * @tc.name testSettingsLiteServiceExtended0009
     * @tc.desc 边界: 操作后立即重置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0009: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      simulateOpenPage(service.getPinModel());
      expect(service.getPinModel().operationCount).assertEqual(1);

      service.reset();
      expect(service.getPinModel().operationCount).assertEqual(0);
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(service.getPinModel().lastOperationTime).assertEqual(0);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_1000
     * @tc.name testSettingsLiteServiceExtended0010
     * @tc.desc 边界: 重复获取 PIN 模型返回同一被操作实例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0010: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      const model1: SettingsItemModel = service.getPinModel();
      simulateOpenPage(model1);
      const model2: SettingsItemModel = service.getPinModel();

      expect(model1 === model2).assertTrue();
      expect(model2.operationCount).assertEqual(1);
      expect(model2.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model2.description).assertEqual('页面已打开');
      expect(service.getNfcModel().operationCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_1100
     * @tc.name testSettingsLiteServiceExtended0011
     * @tc.desc 边界: 获取所有模型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0011: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      const pinModel: SettingsItemModel = service.getPinModel();
      const nfcModel: SettingsItemModel = service.getNfcModel();
      const doubleClickModel: SettingsItemModel = service.getDoubleClickModel();

      expect(pinModel.getTypeName()).assertEqual('PIN 码设置');
      expect(nfcModel.getTypeName()).assertEqual('NFC 设置');
      expect(doubleClickModel.getTypeName()).assertEqual('双击设置');

      const models: SettingsItemModel[] = service.getAllModels();
      expect(models.length).assertEqual(3);
      expect(models[0] === pinModel).assertTrue();
      expect(models[1] === nfcModel).assertTrue();
      expect(models[2] === doubleClickModel).assertTrue();
      expect(pinModel === nfcModel).assertFalse();
    });

    // ========================================
    // 长时间运行测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_1200
     * @tc.name testSettingsLiteServiceExtended0012
     * @tc.desc 边界: 大量操作后计数正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0012: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      const model: SettingsItemModel = service.getPinModel();
      for (let i: number = 0; i < 100; i++) {
        simulateOpenPage(model);
      }

      expect(model.operationCount).assertEqual(100);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(model.lastOperationTime).assertLarger(0);

      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_1300
     * @tc.name testSettingsLiteServiceExtended0013
     * @tc.desc 边界: 反复初始化/销毁
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0013: begin');
      const service: SettingsLiteService = new SettingsLiteService();

      for (let i: number = 0; i < 10; i++) {
        service.initialize();
        expect(service.isServiceInitialized()).assertTrue();
        simulateOpenPage(service.getPinModel());
        service.destroy();
        expect(service.isServiceInitialized()).assertFalse();
      }
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(service.getPinModel().operationCount).assertEqual(0);
    });

    // ========================================
    // 综合场景测试
    // ========================================

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_1400
     * @tc.name testSettingsLiteServiceExtended0014
     * @tc.desc 综合: 初始化 → 操作 → 重置 → 重新操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0014: begin');
      const service: SettingsLiteService = new SettingsLiteService();

      service.initialize();
      simulateOpenPage(service.getPinModel());
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);

      service.reset();
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);

      service.initialize();
      simulateOpenPage(service.getPinModel());
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(service.getPinModel().operationCount).assertEqual(1);

      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_1500
     * @tc.name testSettingsLiteServiceExtended0015
     * @tc.desc 综合: 多次操作后重置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0015: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();

      for (let i: number = 0; i < 5; i++) {
        simulateOpenPage(service.getPinModel());
      }
      for (let i: number = 0; i < 3; i++) {
        simulateOpenPage(service.getNfcModel());
      }
      for (let i: number = 0; i < 2; i++) {
        simulateOpenPage(service.getDoubleClickModel());
      }

      expect(service.getPinModel().operationCount).assertEqual(5);
      expect(service.getNfcModel().operationCount).assertEqual(3);
      expect(service.getDoubleClickModel().operationCount).assertEqual(2);

      service.reset();
      expect(service.getPinModel().operationCount).assertEqual(0);
      expect(service.getNfcModel().operationCount).assertEqual(0);
      expect(service.getDoubleClickModel().operationCount).assertEqual(0);

      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_EXTENDED_1600
     * @tc.name testSettingsLiteServiceExtended0016
     * @tc.desc 综合: 操作 → 销毁 → 重新初始化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceExtended0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteServiceExtended0016: begin');
      const service: SettingsLiteService = new SettingsLiteService();

      service.initialize();
      simulateOpenPage(service.getPinModel());
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);

      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();

      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(service.getPinModel().operationCount).assertEqual(0);

      service.destroy();
    });
  });
}
