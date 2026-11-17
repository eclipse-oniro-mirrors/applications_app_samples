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
import { AppService } from '../../../main/ets/core/AppService';
import { AppState, CallRecord } from '../../../main/ets/core/Types';
import { scenario } from '../support/BoundedCase';
import { FakePlatform, MemoryStore } from '../support/FakePlatform';

function latest(service: AppService, api: string): CallRecord {
  const record = service.getState().logs.find((value: CallRecord): boolean => value.api === api);
  if (record === undefined) {
    throw new Error(`Missing product call record: ${api}`);
  }
  return record;
}

function callById(service: AppService, id: number): CallRecord {
  const record = service.getState().logs.find((value: CallRecord): boolean => value.id === id);
  if (record === undefined) {
    throw new Error(`Missing product call id: ${id}`);
  }
  return record;
}

function snapshotMemory(state: AppState): CallRecord {
  const record = state.latestMemory;
  if (record === undefined) {
    throw new Error('Missing product memory summary');
  }
  return record;
}

export default function coreTests(): void {
  describe('AppPerformanceCore', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0100
     * @tc.name      testAppPerformanceCore0001
     * @tc.desc      Verify 文件参数：三后缀、trim去重及非法输入本地拦截
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0001', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.evictFiles([' libentry.so ', 'entry.hap', 'shared.hsp', 'libentry.so', ' entry.hap ']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:62 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:62 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:63 assertEqual actual', platform.fileCalls[0].join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:63 assertEqual expected', 'libentry.so|entry.hap|shared.hsp'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:64 assertEqual actual', latest(service, 'evictFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:64 assertEqual expected', 'success'));
        const tooMany: string[] = [];
        for (let index = 0; index < 33; index++) {
          tooMany.push(`library${index}.so`);
        }
        const invalid: string[][] = [
          [], [''], ['   '], ['notes.txt'], ['entry.HAP'], ['../libentry.so'],
          ['nested/entry.hap'], ['nested\\shared.hsp'], ['C:\\libentry.so'], ['bad\nname.so'], tooMany
        ];
        platform.fileCalls = [];
        for (let index = 0; index < invalid.length; index++) {
          await service.evictFiles(invalid[index]);
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:76 assertEqual actual', latest(service, 'evictFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:76 assertEqual expected', 'blocked'));
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:77 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:77 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0001 Core.test:78 assertFalse actual', service.getState().memoryBusy)).assertFalse();
        }
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0200
     * @tc.name      testAppPerformanceCore0002
     * @tc.desc      Verify 文件回收：pending到success、原始拒绝码及sdk不可用
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0002', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        platform.deferFile = true;
        const pending = service.evictFiles(['libentry.so']);
        const waiting = latest(service, 'evictFilePages');
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:101 assertEqual actual', waiting.kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:101 assertEqual expected', 'pending'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:102 assertTrue actual', service.getState().memoryBusy)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:103 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:103 assertEqual expected', 1));
        platform.advance(37);
        platform.releaseFile();
        await pending;
        const success = callById(service, waiting.id);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:108 assertEqual actual', success.kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:108 assertEqual expected', 'success'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:109 assertEqual actual', success.code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:109 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:110 assertEqual actual', success.elapsed)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:110 assertEqual expected', 37));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:111 assertFalse actual', success.late)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:112 assertFalse actual', service.getState().memoryBusy)).assertFalse();

        platform.deferFile = false;
        platform.fileErrorCode = 16000163;
        await service.evictFiles(['entry.hap']);
        const failure = latest(service, 'evictFilePages');
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:118 assertEqual actual', failure.kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:118 assertEqual expected', 'error'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:119 assertEqual actual', failure.code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:119 assertEqual expected', 16000163));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:120 assertEqual actual', failure.message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:120 assertEqual expected', 'fixture file rejection'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:121 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:121 assertEqual expected', '调用失败'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:122 assertFalse actual', service.getState().memoryBusy)).assertFalse();

        platform.fileAvailable = false;
        const dispatched = platform.fileCalls.length;
        await service.evictFiles(['shared.hsp']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:127 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:127 assertEqual expected', dispatched));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:128 assertEqual actual', latest(service, 'evictFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:128 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:129 assertEqual actual', latest(service, 'evictFilePages').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0002 Core.test:129 assertEqual expected', '请升级系统'));
      } finally {
        platform.releaseFile();
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0300
     * @tc.name      testAppPerformanceCore0003
     * @tc.desc      Verify 模块与配置：真实names去重、无效模块、配置错误及原始拒绝码
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0003', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.modules = ['entry', 'feature', 'entry'];
      platform.files = ['libs/libentry.so', 'entry.hap', 'shared.hsp', 'libs/libentry.so', 'notes.txt'];
      const service = AppService.fromPlatform(platform);
      try {
        service.refreshTargets();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:152 assertEqual actual', service.getState().modules.join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:152 assertEqual expected', 'entry|feature'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:153 assertEqual actual', service.getState().files.join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:153 assertEqual expected', 'entry.hap|libentry.so|shared.hsp'));
        service.checkConfig();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:155 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:155 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:156 assertEqual actual', service.getState().configText)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:156 assertEqual expected', platform.config.trim()));
        expect(traceParameter(
          'com.samples.appperformance_AppPerformanceCore_0003 ' +
            'Core.test:157 assertEqual actual',
          service.getState().configStatus))
          .assertEqual(traceParameter(
            'com.samples.appperformance_AppPerformanceCore_0003 ' +
              'Core.test:157 assertEqual expected',
            'valid'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:158 assertEqual actual', latest(service, 'getRawFileContentSync').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:158 assertEqual expected', 'success'));

        platform.config = '{"unexpected":[]}';
        service.checkConfig();
        expect(traceParameter(
          'com.samples.appperformance_AppPerformanceCore_0003 ' +
            'Core.test:162 assertEqual actual',
          service.getState().configStatus))
          .assertEqual(traceParameter(
            'com.samples.appperformance_AppPerformanceCore_0003 ' +
              'Core.test:162 assertEqual expected',
            'invalid'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:163 assertEqual actual', latest(service, 'getRawFileContentSync').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:163 assertEqual expected', 'error'));
        platform.config = '{';
        service.checkConfig();
        expect(traceParameter(
          'com.samples.appperformance_AppPerformanceCore_0003 ' +
            'Core.test:166 assertEqual actual',
          service.getState().configStatus))
          .assertEqual(traceParameter(
            'com.samples.appperformance_AppPerformanceCore_0003 ' +
              'Core.test:166 assertEqual expected',
            'config_read_failed'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:167 assertEqual actual', latest(service, 'getRawFileContentSync').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:167 assertEqual expected', 'error'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:168 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:168 assertEqual expected', 3));

        // Config diagnostics are not a product gate for otherwise valid real modules.
        await service.evictModules([' entry ', 'feature', 'entry']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:172 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:172 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:173 assertEqual actual', platform.moduleCalls[0].join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:173 assertEqual expected', 'entry|feature'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:174 assertEqual actual', latest(service, 'evictModuleFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:174 assertEqual expected', 'success'));
        await service.evictModules(['not-a-real-module']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:176 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:176 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:177 assertEqual actual', latest(service, 'evictModuleFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:177 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:178 assertEqual actual', latest(service, 'evictModuleFilePages').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:178 assertEqual expected', '请选择真实模块'));

        platform.moduleErrorCode = 16000164;
        await service.evictModules(['entry']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:182 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:182 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:183 assertEqual actual', latest(service, 'evictModuleFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:183 assertEqual expected', 'error'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:184 assertEqual actual', latest(service, 'evictModuleFilePages').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:184 assertEqual expected', 16000164));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:185 assertEqual actual', latest(service, 'evictModuleFilePages').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0003 Core.test:185 assertEqual expected', 'fixture module rejection'));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0400
     * @tc.name      testAppPerformanceCore0004
     * @tc.desc      Verify 资源：先校验拦截、baseline字节一致与变化、读取失败
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0004', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:205 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:205 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:206 assertEqual actual', latest(service, 'getRawFileContent').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:206 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:207 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:207 assertEqual expected', '请先读取资源'));

        await service.readResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:210 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:210 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:211 assertTrue actual', service.getState().resourceText.indexOf('3 字节') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:212 assertEqual actual', latest(service, 'getRawFileContent').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:212 assertEqual expected', 'success'));
        platform.resource = new Uint8Array([65, 66, 67]);
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:215 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:215 assertEqual expected', '校验一致'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:216 assertEqual actual', latest(service, 'getRawFileContent').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:216 assertEqual expected', '校验一致'));
        platform.resource[2] = 68;
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:219 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:219 assertEqual expected', '校验不一致'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:220 assertEqual actual', latest(service, 'getRawFileContent').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:220 assertEqual expected', '校验不一致'));

        platform.resourceErrorCode = 13400001;
        await service.readResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:224 assertEqual actual', service.getState().resourceText)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:224 assertEqual expected', '读取失败'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:225 assertFalse actual', service.getState().resourceBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:226 assertEqual actual', latest(service, 'getRawFileContent').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:226 assertEqual expected', 'error'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:227 assertEqual actual', latest(service, 'getRawFileContent').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:227 assertEqual expected', 13400001));
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:229 assertEqual actual', service.getState().resourceText)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:229 assertEqual expected', '校验失败'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:230 assertFalse actual', service.getState().resourceBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:231 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0004 Core.test:231 assertEqual expected', 5));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0500
     * @tc.name      testAppPerformanceCore0005
     * @tc.desc      Verify 快启：true/false、本地记录、失败保留值与串行持久化恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0005', async (): Promise<void> => {
      const store = new MemoryStore();
      const platform = new FakePlatform(store);
      const service = AppService.fromPlatform(platform);
      try {
        service.setSnapEnabled(true);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:252 assertEqual actual', platform.snapCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:252 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:253 assertTrue actual', platform.snapCalls[0])).assertTrue();
        expect(traceParameter(
          'com.samples.appperformance_AppPerformanceCore_0005 ' +
            'Core.test:254 assertEqual actual',
          service.getState().snapFlag))
          .assertEqual(traceParameter(
            'com.samples.appperformance_AppPerformanceCore_0005 ' +
              'Core.test:254 assertEqual expected',
            'enabled'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:255 assertEqual actual', latest(service, 'setHyperSnapEnabled').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:255 assertEqual expected', 'success'));
        platform.advance(25);
        service.setSnapEnabled(false);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:258 assertEqual actual', platform.snapCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:258 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:259 assertFalse actual', platform.snapCalls[1])).assertFalse();
        const saved = service.getState();
        expect(traceParameter(
          'com.samples.appperformance_AppPerformanceCore_0005 ' +
            'Core.test:261 assertEqual actual',
          saved.snapFlag))
          .assertEqual(traceParameter(
            'com.samples.appperformance_AppPerformanceCore_0005 ' +
              'Core.test:261 assertEqual expected',
            'disabled'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:262 assertEqual actual', saved.snapAt)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:262 assertEqual expected', platform.wallNow()));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:263 assertEqual actual', latest(service, 'setHyperSnapEnabled').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:263 assertEqual expected', 'success'));

        platform.advance(25);
        platform.setErrorCode = 16000150;
        service.setSnapEnabled(true);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:268 assertEqual actual', platform.snapCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:268 assertEqual expected', 3));
        expect(traceParameter(
          'com.samples.appperformance_AppPerformanceCore_0005 ' +
            'Core.test:269 assertEqual actual',
          service.getState().snapFlag))
          .assertEqual(traceParameter(
            'com.samples.appperformance_AppPerformanceCore_0005 ' +
              'Core.test:269 assertEqual expected',
            'disabled'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:270 assertEqual actual', service.getState().snapAt)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:270 assertEqual expected', saved.snapAt));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:271 assertEqual actual', latest(service, 'setHyperSnapEnabled').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:271 assertEqual expected', 'error'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:272 assertEqual actual', latest(service, 'setHyperSnapEnabled').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:272 assertEqual expected', 16000150));
        await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:274 assertTrue actual', store.value.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:275 assertTrue actual', store.writeCalls.length > 0)).assertTrue();

        // A distinct platform has its own clock, but shares only the in-memory store.
        const restoredPlatform = new FakePlatform(store);
        const restored = AppService.fromPlatform(restoredPlatform);
        try {
          expect(traceParameter(
            'com.samples.appperformance_AppPerformanceCore_0005 ' +
              'Core.test:281 assertEqual actual',
            restored.getState().snapFlag))
            .assertEqual(traceParameter(
              'com.samples.appperformance_AppPerformanceCore_0005 ' +
                'Core.test:281 assertEqual expected',
              'disabled'));
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:282 assertEqual actual', restored.getState().snapAt)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:282 assertEqual expected', saved.snapAt));
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:283 assertEqual actual', latest(restored, 'setHyperSnapEnabled').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:283 assertEqual expected', 'error'));
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:284 assertEqual actual', latest(restored, 'setHyperSnapEnabled').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:284 assertEqual expected', 16000150));
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:285 assertEqual actual', restoredPlatform.snapCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:285 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:286 assertEqual actual', restored.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0005 Core.test:286 assertEqual expected', ''));
        } finally {
          restored.dispose();
        }
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0600
     * @tc.name      testAppPerformanceCore0006
     * @tc.desc      Verify 重建：成功冷却、虚拟十秒、存储失败不绕过及原始异常码
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0006', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.store.writeFailure = true;
      const service = AppService.fromPlatform(platform);
      try {
        service.rebuildSnap('第一次');
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:310 assertEqual actual', platform.rebuildCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:310 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:311 assertEqual actual', latest(service, 'requestRebuildHyperSnap').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:311 assertEqual expected', 'success'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:312 assertEqual actual', service.getState().rebuildWaitSeconds)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:312 assertEqual expected', 10));
        await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:314 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:314 assertEqual expected', '存储写入失败'));
        service.rebuildSnap('立即重复');
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:316 assertEqual actual', platform.rebuildCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:316 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:317 assertEqual actual', latest(service, 'requestRebuildHyperSnap').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:317 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:318 assertEqual actual', service.getState().rebuildWaitSeconds)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:318 assertEqual expected', 10));

        platform.advance(10000);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:321 assertEqual actual', service.getState().rebuildWaitSeconds)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:321 assertEqual expected', 0));
        service.rebuildSnap('冷却结束');
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:323 assertEqual actual', platform.rebuildCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:323 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:324 assertEqual actual', latest(service, 'requestRebuildHyperSnap').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:324 assertEqual expected', 'success'));
        const lastSuccessAt = service.getState().rebuildAt;
        platform.advance(10000);
        platform.rebuildErrorCode = 16000150;
        service.rebuildSnap('系统拒绝');
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:329 assertEqual actual', platform.rebuildCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:329 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:330 assertEqual actual', latest(service, 'requestRebuildHyperSnap').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:330 assertEqual expected', 'error'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:331 assertEqual actual', latest(service, 'requestRebuildHyperSnap').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:331 assertEqual expected', 16000150));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:332 assertEqual actual', latest(service, 'requestRebuildHyperSnap').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:332 assertEqual expected', 'fixture rebuild rejection'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:333 assertEqual actual', service.getState().rebuildAt)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:333 assertEqual expected', lastSuccessAt));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:334 assertEqual actual', service.getState().rebuildWaitSeconds)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0006 Core.test:334 assertEqual expected', 0));
        await service.whenSaved();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0700
     * @tc.name      testAppPerformanceCore0007
     * @tc.desc      Verify 内存虚拟超时：保持锁、同id迟到成功及订阅与快照隔离
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0007', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.deferFile = true;
      const service = AppService.fromPlatform(platform);
      let notifications: number = 0;
      const listener = service.subscribe((): void => { notifications++; });
      try {
        const pending = service.evictFiles(['libentry.so']);
        const original = service.getState();
        const memory = snapshotMemory(original);
        const id = memory.id;
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:361 assertEqual actual', memory.kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:361 assertEqual expected', 'pending'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:362 assertTrue actual', original.memoryBusy)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:363 assertTrue actual', notifications > 0)).assertTrue();
        const beforeTimeout = notifications;
        platform.advance(10000);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:366 assertEqual actual', callById(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:366 assertEqual expected', 'timeout'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:367 assertEqual actual', callById(service, id).elapsed)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:367 assertEqual expected', 10000));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:368 assertTrue actual', service.getState().memoryBusy)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:369 assertTrue actual', notifications > beforeTimeout)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:370 assertEqual actual', memory.kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:370 assertEqual expected', 'pending'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:371 assertEqual actual', original.logs[0].kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:371 assertEqual expected', 'pending'));

        await service.evictFiles(['entry.hap']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:374 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:374 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:375 assertEqual actual', latest(service, 'evictFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:375 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:376 assertTrue actual', service.getState().memoryBusy)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:377 assertEqual actual', callById(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:377 assertEqual expected', 'timeout'));
        const beforeRelease = notifications;
        platform.releaseFile();
        platform.releaseFile();
        await pending;
        const finished = callById(service, id);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:383 assertEqual actual', finished.kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:383 assertEqual expected', 'success'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:384 assertEqual actual', finished.code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:384 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:385 assertTrue actual', finished.late)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:386 assertEqual actual', finished.elapsed)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:386 assertEqual expected', 10000));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:387 assertFalse actual', service.getState().memoryBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:388 assertEqual actual', service.getState().logs.filter((value: CallRecord): boolean => value.id === id).length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:388 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:389 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:389 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:390 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:390 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:391 assertTrue actual', notifications > beforeRelease)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:392 assertEqual actual', memory.kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:392 assertEqual expected', 'pending'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:393 assertFalse actual', memory.late)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:394 assertTrue actual', original.memoryBusy)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:395 assertEqual actual', original.logs[0].kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:395 assertEqual expected', 'pending'));

        service.unsubscribe(listener);
        const afterUnsubscribe = notifications;
        service.setForeground(false);
        service.setForeground(true);
        expect(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:401 assertEqual actual', notifications)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceCore_0007 Core.test:401 assertEqual expected', afterUnsubscribe));
      } finally {
        platform.releaseFile();
        service.unsubscribe(listener);
        service.dispose();
      }
    });
  });
}
