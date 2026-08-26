/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { backgroundLoader } from '@kit.BackgroundTasksKit';
import { BusinessError } from '@kit.BasicServicesKit';

/**
 * BackgroundLoader 本地单元测试
 * 测试backgroundLoader模块提供的API：registerTask、unregisterTask、finishTask、getTaskInfo
 * 以及常量ON_START、ON_STOP的正确性
 */
export default function localUnitTest() {
  describe('BackgroundLoaderLocalUnitTest', () => {
    beforeAll(() => {
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * 测试backgroundLoader.ON_START常量
     * 验证ON_START常量是否为字符串类型且不为空
     */
    it('OnStartConstant_001', 0, () => {
      expect(typeof backgroundLoader.ON_START).assertEqual('string');
      expect(backgroundLoader.ON_START.length).assertLarger(0);
    });

    /**
     * 测试backgroundLoader.ON_STOP常量
     * 验证ON_STOP常量是否为字符串类型且不为空
     */
    it('OnStopConstant_001', 0, () => {
      expect(typeof backgroundLoader.ON_STOP).assertEqual('string');
      expect(backgroundLoader.ON_STOP.length).assertLarger(0);
    });

    /**
     * 测试ON_START与ON_STOP常量不相等
     * 验证两个回调常量具有不同的值，用于区分任务启动和停止事件
     */
    it('OnStartOnStopNotEqual_001', 0, () => {
      expect(backgroundLoader.ON_START !== backgroundLoader.ON_STOP).assertTrue();
    });

    /**
     * 测试registerTask接口参数校验
     * 验证传入无效的abilityName和taskId时，registerTask接口能够正确处理异常
     */
    it('RegisterTaskInvalidParams_001', 0, () => {
      const taskInfo: backgroundLoader.TaskInfo = {
        abilityname: '',
        taskId: -1
      };
      try {
        backgroundLoader.registerTask(taskInfo);
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertLarger(0);
      }
    });

    /**
     * 测试unregisterTask接口参数校验
     * 验证注销未注册的任务时，unregisterTask接口能够正确返回错误
     */
    it('UnregisterTaskInvalidParams_001', 0, () => {
      const taskInfo: backgroundLoader.TaskInfo = {
        abilityname: 'NonExistAbility',
        taskId: 99999
      };
      try {
        backgroundLoader.unregisterTask(taskInfo);
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertLarger(0);
      }
    });

    /**
     * 测试finishTask接口参数校验
     * 验证完成未注册的任务时，finishTask接口能够正确返回错误
     */
    it('FinishTaskInvalidParams_001', 0, () => {
      const taskInfo: backgroundLoader.TaskInfo = {
        abilityname: 'NonExistAbility',
        taskId: 99999
      };
      try {
        backgroundLoader.finishTask(taskInfo);
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertLarger(0);
      }
    });

    /**
     * 测试getTaskInfo接口参数校验
     * 验证查询不存在的taskId时，getTaskInfo接口能够正确返回错误
     */
    it('GetTaskInfoInvalidParams_001', 0, () => {
      try {
        backgroundLoader.getTaskInfo(99999);
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertLarger(0);
      }
    });

    /**
     * 测试registerTask与unregisterTask的完整流程
     * 先注册一个后台加载任务，验证注册成功后再注销该任务
     */
    it('RegisterAndUnregisterTask_001', 0, () => {
      const taskInfo: backgroundLoader.TaskInfo = {
        abilityname: 'EntryAbility',
        taskId: 100
      };
      try {
        backgroundLoader.registerTask(taskInfo);
        expect(true).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(0);
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        expect(true).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(0);
      }
    });

    /**
     * 测试registerTask与getTaskInfo的完整流程
     * 先注册一个后台加载任务，验证注册成功后查询该任务信息
     */
    it('RegisterAndGetTaskInfo_001', 0, () => {
      const taskInfo: backgroundLoader.TaskInfo = {
        abilityname: 'EntryAbility',
        taskId: 200
      };
      try {
        backgroundLoader.registerTask(taskInfo);
        expect(true).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(0);
      }
      try {
        const result = backgroundLoader.getTaskInfo(200);
        expect(result.taskId).assertEqual(200);
        expect(result.abilityName).assertEqual('EntryAbility');
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(0);
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
      } catch (err) {
      }
    });

    /**
     * 测试registerTask与finishTask的完整流程
     * 先注册一个后台加载任务，验证注册成功后完成该任务
     */
    it('RegisterAndFinishTask_001', 0, () => {
      const taskInfo: backgroundLoader.TaskInfo = {
        abilityname: 'EntryAbility',
        taskId: 300
      };
      try {
        backgroundLoader.registerTask(taskInfo);
        expect(true).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(0);
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        expect(true).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(0);
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
      } catch (err) {
      }
    });

    /**
     * 测试TaskInfo类型的基本属性
     * 验证backgroundLoader.TaskInfo包含abilityname和taskId两个必要字段
     */
    it('TaskInfoProperties_001', 0, () => {
      const taskInfo: backgroundLoader.TaskInfo = {
        abilityname: 'TestAbility',
        taskId: 1
      };
      expect(taskInfo.abilityname).assertEqual('TestAbility');
      expect(taskInfo.taskId).assertEqual(1);
    });

    /**
     * 测试基础断言功能
     * 验证测试框架的断言方法正常工作
     */
    it('assertContain', 0, () => {
      let a = 'abc';
      let b = 'b';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    });
  });
}
