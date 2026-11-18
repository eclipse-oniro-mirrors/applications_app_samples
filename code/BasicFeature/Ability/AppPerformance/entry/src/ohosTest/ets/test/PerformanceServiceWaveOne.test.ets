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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
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
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:35 assertUndefined actual', await service.runExperiment('W-UNKNOWN', 'files'))).assertUndefined();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:36 assertUndefined actual', await service.runExperiment('W-TEXT', 'unknown'))).assertUndefined();
        service.dispose();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:38 assertUndefined actual', await service.runExperiment('W-TEXT', 'files'))).assertUndefined();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:39 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:39 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:40 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:40 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:41 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0001 PerformanceServiceWaveOne.test:41 assertEqual expected', 0));
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
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0002 ' +
            'PerformanceServiceWaveOne.test:60 assertEqual actual',
          record.stage('warm')?.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0002 ' +
              'PerformanceServiceWaveOne.test:60 assertEqual expected',
            'cancelled'));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:61 assertEqual actual', record.skipped())).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:61 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:62 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:62 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:63 assertTrue actual', service.isQuarantined())).assertTrue();
        const terminal = JSON.stringify(service.ledgerRecords());
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:66 assertEqual actual', JSON.stringify(service.ledgerRecords()))).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:66 assertEqual expected', terminal));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:67 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:67 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0002 PerformanceServiceWaveOne.test:68 assertFalse actual', service.isExperimentBusy())).assertFalse();
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
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:85 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:85 assertEqual expected', 2));
        platform.advance(10000);
        const record = waveRequired(await running);
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0003 ' +
            'PerformanceServiceWaveOne.test:88 assertEqual actual',
          record.stage('reread')?.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0003 ' +
              'PerformanceServiceWaveOne.test:88 assertEqual expected',
            'timeout'));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:89 assertEqual actual', record.beforeBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:89 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:90 assertEqual actual', record.afterBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:90 assertEqual expected', 0));
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0003 ' +
            'PerformanceServiceWaveOne.test:91 assertEqual actual',
          record.stage('configAgain')?.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0003 ' +
              'PerformanceServiceWaveOne.test:91 assertEqual expected',
            'skipped'));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:92 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:92 assertEqual expected', 1));
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:94 assertEqual actual', service.ledgerRecords()[0].digestAfter)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:94 assertEqual expected', ''));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0003 PerformanceServiceWaveOne.test:95 assertFalse actual', service.isQuarantined())).assertFalse();
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
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:114 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:114 assertEqual expected', 1));
        service.dispose();
        const afterDispose = notifications;
        const record = waveRequired(await running);
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0004 ' +
            'PerformanceServiceWaveOne.test:118 assertEqual actual',
          record.stage('warm')?.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0004 ' +
              'PerformanceServiceWaveOne.test:118 assertEqual expected',
            'cancelled'));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:119 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:119 assertEqual expected', 0));
        platform.reply.reject(new Error('late resource rejection')); await waveDrain();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:121 assertEqual actual', notifications)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:121 assertEqual expected', afterDispose));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:122 assertFalse actual', service.isExperimentBusy())).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:123 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0004 PerformanceServiceWaveOne.test:123 assertEqual expected', 1));
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
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:142 assertEqual actual', service.ledgerRecords()[0].id)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:142 assertEqual expected', 'retained'));
        service.cancelExperiment(); await running;
        service.clearLedger();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:145 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:145 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:146 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:146 assertEqual expected', '实验或系统请求在途，不能清空账本'));
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain();
        service.clearLedger();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:149 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:149 assertEqual expected', 0));
        await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:151 assertEqual actual', platform.store.value.indexOf('retained'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0005 PerformanceServiceWaveOne.test:151 assertEqual expected', -1));
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
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:170 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:170 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:171 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:171 assertEqual expected', '实验或系统请求在途，不能清空账本'));
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await running;
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:173 assertEqual actual', service.getState().resourceText)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:173 assertEqual expected', '3 字节 · ABC'));
        service.clearLedger(); await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:175 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:175 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:176 assertEqual actual', service.getState().logs[0].kind)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0006 PerformanceServiceWaveOne.test:176 assertEqual expected', 'success'));
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
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:195 assertTrue actual', configStage.detail.indexOf('配置目标未在安装目录证实') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:196 assertEqual actual', files.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:196 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:197 assertEqual actual', files.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:197 assertEqual expected', 0));
      } finally { fileService.dispose(); }
      const control = new FakePlatform(); control.config = files.config;
      const controlService = AppService.fromPlatform(control);
      try {
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:202 assertTrue actual', waveRequired(await controlService.runExperiment('W-TEXT', 'control')).complete())).assertTrue();
      } finally { controlService.dispose(); }
      const modules = new FakePlatform(); modules.config = files.config;
      const moduleService = AppService.fromPlatform(modules);
      try {
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:207 assertTrue actual', waveRequired(await moduleService.runExperiment('W-TEXT', 'modules')).complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:208 assertEqual actual', modules.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0007 PerformanceServiceWaveOne.test:208 assertEqual expected', 1));
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
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0008 ' +
            'PerformanceServiceWaveOne.test:225 assertEqual actual',
          record.integrity))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0008 ' +
              'PerformanceServiceWaveOne.test:225 assertEqual expected',
            'consistent'));
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0008 ' +
            'PerformanceServiceWaveOne.test:226 assertEqual actual',
          record.stage('configAgain')?.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0008 ' +
              'PerformanceServiceWaveOne.test:226 assertEqual expected',
            'failed'));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0008 PerformanceServiceWaveOne.test:227 assertEqual actual', record.stage('configAgain')?.detail)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0008 PerformanceServiceWaveOne.test:227 assertEqual expected', '回读失败：171002'));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0008 PerformanceServiceWaveOne.test:228 assertEqual actual', record.failed())).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0008 PerformanceServiceWaveOne.test:228 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0008 PerformanceServiceWaveOne.test:229 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0008 PerformanceServiceWaveOne.test:229 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0008 PerformanceServiceWaveOne.test:230 assertFalse actual', record.complete())).assertFalse();
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
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:247 assertEqual actual', record.stage('reread')?.detail)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:247 assertEqual expected', '重读失败：171001'));
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0009 ' +
            'PerformanceServiceWaveOne.test:248 assertEqual actual',
          record.stage('configAgain')?.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0009 ' +
              'PerformanceServiceWaveOne.test:248 assertEqual expected',
            'success'));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:249 assertEqual actual', record.beforeBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:249 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:250 assertEqual actual', record.afterBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:250 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:251 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:251 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:252 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceServiceWaveOne_0009 PerformanceServiceWaveOne.test:252 assertEqual expected', 2));
        expect(traceParameter(
          'com.samples.appperformance_PerformanceServiceWaveOne_0009 ' +
            'PerformanceServiceWaveOne.test:253 assertEqual actual',
          record.integrity))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceServiceWaveOne_0009 ' +
              'PerformanceServiceWaveOne.test:253 assertEqual expected',
            'inconsistent'));
      } finally { service.dispose(); }
    });
  });
}
