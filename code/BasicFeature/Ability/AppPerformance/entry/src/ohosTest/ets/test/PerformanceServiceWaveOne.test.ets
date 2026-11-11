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

import { describe, expect, it } from '@ohos/hypium';
import { AppService } from '../../../main/ets/core/AppService';
import { FakePlatform } from '../support/FakePlatform';
import { WaveResourcePlatform, waveDrain, waveRecord, waveRequired } from '../support/PerformanceWaveOneFixtures';

export default function performanceServiceWaveOneTests(): void {
  describe('PerformanceServiceWaveOne', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0100
     * @tc.name testPerformanceServiceWaveOne0001
     * @tc.desc 无效实验输入和释放后的调用都不创建流程、账本或SDK请求
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0001', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        expect(await service.runExperiment('W-UNKNOWN', 'files')).assertUndefined();
        expect(await service.runExperiment('W-TEXT', 'unknown')).assertUndefined();
        service.dispose();
        expect(await service.runExperiment('W-TEXT', 'files')).assertUndefined();
        expect(service.ledgerRecords().length).assertEqual(0);
        expect(platform.resourceCalls).assertEqual(0);
        expect(service.getState().logs.length).assertEqual(0);
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0200
     * @tc.name testPerformanceServiceWaveOne0002
     * @tc.desc 首次读取期间取消跳过回收，迟到成功不回填已结束账本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0002', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        const running = service.runExperiment('W-TEXT', 'files'); await waveDrain();
        service.cancelExperiment();
        const record = waveRequired(await running);
        expect(record.stage('warm')?.status).assertEqual('已取消');
        expect(record.skipped()).assertEqual(3);
        expect(platform.fileCalls.length).assertEqual(0);
        expect(service.isQuarantined()).assertTrue();
        const terminal = JSON.stringify(service.ledgerRecords());
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain();
        expect(JSON.stringify(service.ledgerRecords())).assertEqual(terminal);
        expect(platform.resourceCalls).assertEqual(1);
        expect(service.isExperimentBusy()).assertFalse();
      } finally { platform.reply.resolve(new Uint8Array()); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0300
     * @tc.name testPerformanceServiceWaveOne0003
     * @tc.desc 重读阶段超时保留初次采样事实，迟到资源不补写after字段或回读配置
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0003', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform(); platform.deferAt = 2;
      const service = AppService.fromPlatform(platform);
      try {
        const running = service.runExperiment('W-TEXT', 'files'); await waveDrain();
        expect(platform.resourceCalls).assertEqual(2);
        platform.advance(10000);
        const record = waveRequired(await running);
        expect(record.stage('reread')?.status).assertEqual('超时');
        expect(record.beforeBytes).assertEqual(3);
        expect(record.afterBytes).assertEqual(0);
        expect(record.stage('configAgain')?.status).assertEqual('跳过');
        expect(platform.configCalls).assertEqual(1);
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain();
        expect(service.ledgerRecords()[0].digestAfter).assertEqual('');
        expect(service.isQuarantined()).assertFalse();
      } finally { platform.reply.resolve(new Uint8Array()); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0400
     * @tc.name testPerformanceServiceWaveOne0004
     * @tc.desc 已发起读取后释放服务，完成取消记录且不再通知已移除监听者
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0004', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform();
      const service = AppService.fromPlatform(platform);
      let notifications = 0;
      service.subscribe((): void => { notifications++; });
      try {
        const running = service.runExperiment('W-TEXT', 'files'); await waveDrain();
        expect(platform.resourceCalls).assertEqual(1);
        service.dispose();
        const afterDispose = notifications;
        const record = waveRequired(await running);
        expect(record.stage('warm')?.status).assertEqual('已取消');
        expect(platform.pendingTimers()).assertEqual(0);
        platform.reply.reject(new Error('late resource rejection')); await waveDrain();
        expect(notifications).assertEqual(afterDispose);
        expect(service.isExperimentBusy()).assertFalse();
        expect(service.ledgerRecords().length).assertEqual(1);
      } finally { platform.reply.resolve(new Uint8Array()); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0500
     * @tc.name testPerformanceServiceWaveOne0005
     * @tc.desc 本地实验已取消但底层读取未返回时仍禁止清空账本，排空后才允许
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0005', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform();
      const service = AppService.fromPlatform(platform);
      service.appendExperiment(waveRecord('retained'));
      try {
        const running = service.runExperiment('W-TEXT', 'control'); await waveDrain();
        service.clearLedger();
        expect(service.ledgerRecords()[0].id).assertEqual('retained');
        service.cancelExperiment(); await running;
        service.clearLedger();
        expect(service.ledgerRecords().length).assertEqual(2);
        expect(service.getState().notice).assertEqual('实验或系统请求在途，不能清空账本');
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain();
        service.clearLedger();
        expect(service.ledgerRecords().length).assertEqual(0);
        await service.whenSaved();
        expect(platform.store.value.indexOf('retained')).assertEqual(-1);
      } finally { platform.reply.resolve(new Uint8Array()); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0600
     * @tc.name testPerformanceServiceWaveOne0006
     * @tc.desc 手动资源读取也占用清空守卫，读取完成后可以清除且不回填旧账本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0006', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform();
      const service = AppService.fromPlatform(platform);
      service.appendExperiment(waveRecord('manual-read-guard'));
      try {
        const running = service.readResource();
        service.clearLedger();
        expect(service.ledgerRecords().length).assertEqual(1);
        expect(service.getState().notice).assertEqual('实验或系统请求在途，不能清空账本');
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await running;
        expect(service.getState().resourceText).assertEqual('3 字节 · ABC');
        service.clearLedger(); await service.whenSaved();
        expect(service.ledgerRecords().length).assertEqual(0);
        expect(service.getState().logs[0].kind).assertEqual('success');
      } finally { platform.reply.resolve(new Uint8Array()); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0700
     * @tc.name testPerformanceServiceWaveOne0007
     * @tc.desc 未安装的配置文件只拦截文件实验，不误拦不使用该集合的对照及模块实验
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0007', 0, async (): Promise<void> => {
      const files = new FakePlatform(); files.config = '{"evictFilePages":["absent.so"]}';
      const fileService = AppService.fromPlatform(files);
      try {
        const record = waveRequired(await fileService.runExperiment('W-TEXT', 'files'));
        const configStage = record.stage('config');
        if (configStage === undefined) { throw new Error('Missing config stage'); }
        expect(configStage.detail.indexOf('配置目标未在安装目录证实') >= 0).assertTrue();
        expect(files.resourceCalls).assertEqual(0);
        expect(files.fileCalls.length).assertEqual(0);
      } finally { fileService.dispose(); }
      const control = new FakePlatform(); control.config = files.config;
      const controlService = AppService.fromPlatform(control);
      try {
        expect(waveRequired(await controlService.runExperiment('W-TEXT', 'control')).complete()).assertTrue();
      } finally { controlService.dispose(); }
      const modules = new FakePlatform(); modules.config = files.config;
      const moduleService = AppService.fromPlatform(modules);
      try {
        expect(waveRequired(await moduleService.runExperiment('W-TEXT', 'modules')).complete()).assertTrue();
        expect(modules.moduleCalls.length).assertEqual(1);
      } finally { moduleService.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0800
     * @tc.name testPerformanceServiceWaveOne0008
     * @tc.desc 配置回读抛错仍保留业务资源一致的事实，并单独记录失败阶段
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0008', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform(); platform.deferAt = 0; platform.rejectConfigAt = 2;
      const service = AppService.fromPlatform(platform);
      try {
        const record = waveRequired(await service.runExperiment('W-TEXT', 'files'));
        expect(record.integrity).assertEqual('一致');
        expect(record.stage('configAgain')?.status).assertEqual('失败');
        expect(record.stage('configAgain')?.detail).assertEqual('回读失败：171002');
        expect(record.failed()).assertEqual(1);
        expect(platform.fileCalls.length).assertEqual(1);
        expect(record.complete()).assertFalse();
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERVICEWAVEONE_0900
     * @tc.name testPerformanceServiceWaveOne0009
     * @tc.desc 业务重读拒绝仍继续回读配置，不重新下发回收或丢掉首次样本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceServiceWaveOne0009', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform(); platform.deferAt = 0; platform.rejectReadAt = 2;
      const service = AppService.fromPlatform(platform);
      try {
        const record = waveRequired(await service.runExperiment('W-TEXT', 'files'));
        expect(record.stage('reread')?.detail).assertEqual('重读失败：171001');
        expect(record.stage('configAgain')?.status).assertEqual('成功');
        expect(record.beforeBytes).assertEqual(3);
        expect(record.afterBytes).assertEqual(0);
        expect(platform.fileCalls.length).assertEqual(1);
        expect(platform.configCalls).assertEqual(2);
        expect(record.integrity).assertEqual('不一致');
      } finally { service.dispose(); }
    });
  });
}
