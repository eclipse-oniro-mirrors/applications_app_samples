/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

/*
 * 单元测试框架数据驱动能力从hypium 1.0.2版本开始支持
 * 数据参数传递 : 为指定测试套、测试用例传递测试输入数据参数
 * 压力测试 : 为指定测试套、测试用例设置执行次数
 * ① .test.js|ets文件同目录创建data.json数据文件,如下数据
 *
 * {
 * "suites": [{
 *   "describe": ["paramExampleTest"],
 *   "stress": 4,
 *   "params": {
 *     "suiteParams1": "suiteParams001",
 *     "suiteParams2": "suiteParams002"
 *   },
 *   "items": [{
 *     "it": "testJsunitSuiteParameters0001"
 *   },
 *     {
 *       "it": "testJsunitItemParameters0002",
 *       "stress": 2,
 *       "params":[
 *         {
 *           "ts1": "ts1",
 *           "ts2": "ts2"
 *         }
 *       ]
 *     }]
 * }]
 * }
 * 配置参数说明：
 * "suite"	测试套配置
 * "items"	测试用例配置
 * "describe"	测试套名称
 * "it"	测试用例名称
 * "params"	测试套 / 测试用例 可传入使用的参数
 * "stress"	测试套 / 测试用例 指定执行次数
 * ② 在TestAbility目录下app.js|ets文件中导入data.json，并在Hypium.hypiumTest() 方法执行前，设置参数数据
 * Hypium.setData(data);
 * Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
 *
 * 指导文档
 * https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/application-test/arkxtest-guidelines.md
 */

import { beforeEach, describe, expect, it, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

interface SuiteParam {
  suiteParams1: string;
  suiteParams2: string;
}

interface ItemParam extends SuiteParam {
  ts1: string;
  ts2: string;
}

interface RowParam extends SuiteParam {
  name: string;
  value: string;
}

// Hypium injects data.json only into callbacks with both done and the data parameter.
export default function paramExampleTest(): void {
  describe('paramExampleTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitSuiteParameters0001
     * @tc.name testJsunitSuiteParameters0001
     * @tc.desc Validate both injected suite fields and absence of item-only fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitSuiteParameters0001', TestType.FUNCTION, (done: () => void, data: SuiteParam): void => {
      hilog.info(0x0000, 'ParamExample', 'suite data=%{public}s', JSON.stringify(data));
      expect(data.suiteParams1).assertEqual('suiteParams001');
      hilog.info(0x0000, 'ParamExample', 'suiteParams2=%{public}s expected=suiteParams002', data.suiteParams2);
      expect(data.suiteParams2).assertEqual('suiteParams002');
      const keys: string[] = Object.keys(data).sort();
      hilog.info(0x0000, 'ParamExample', 'suite keys=%{public}s expected=[suiteParams1,suiteParams2]',
        JSON.stringify(keys));
      expect(keys).assertDeepEquals(['suiteParams1', 'suiteParams2']);
      done();
    });

    /**
     * @tc.number testJsunitItemParameters0002
     * @tc.name testJsunitItemParameters0002
     * @tc.desc Validate the actual merge of suite parameters with item parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitItemParameters0002', TestType.FUNCTION, (done: () => void, data: ItemParam): void => {
      hilog.info(0x0000, 'ParamExample', 'merged item=%{public}s', JSON.stringify(data));
      expect([data.suiteParams1, data.suiteParams2]).assertDeepEquals(['suiteParams001', 'suiteParams002']);
      hilog.info(0x0000, 'ParamExample', 'ts1=%{public}s expected=ts1', data.ts1);
      expect(data.ts1).assertEqual('ts1');
      hilog.info(0x0000, 'ParamExample', 'ts2=%{public}s expected=ts2', data.ts2);
      expect(data.ts2).assertEqual('ts2');
      const keys: string[] = Object.keys(data).sort();
      hilog.info(0x0000, 'ParamExample', 'item keys=%{public}s expected=[suiteParams1,suiteParams2,ts1,ts2]',
        JSON.stringify(keys));
      expect(keys).assertDeepEquals(['suiteParams1', 'suiteParams2', 'ts1', 'ts2']);
      done();
    });
  });
}

// Keep the old DataDriver entry runnable, but consolidate its empty examples into this data topic.
export function dataDriverExampleTest(): void {
  describe('AbilityTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitDataRows0003
     * @tc.name testJsunitDataRows0003
     * @tc.desc Validate distinct injected name/value rows and their inherited suite data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitDataRows0003', TestType.FUNCTION, (done: () => void, data: RowParam): void => {
      hilog.info(0x0000, 'ParamExample', 'driver row=%{public}s', JSON.stringify(data));
      expect(['name', 'value']).assertContain(data.name);
      // Independent name/value oracle; neither expected value comes from the injected row.
      if (data.name === 'name') {
        hilog.info(0x0000, 'ParamExample', 'row name=%{public}s value=%{public}s expected=driverName',
          data.name, data.value);
        expect(data.value).assertEqual('driverName');
      } else {
        hilog.info(0x0000, 'ParamExample', 'row name=%{public}s value=%{public}s expected=driverValue',
          data.name, data.value);
        expect(data.value).assertEqual('driverValue');
      }
      const suiteValues: string[] = [data.suiteParams1, data.suiteParams2];
      hilog.info(0x0000, 'ParamExample', 'row suite values=%{public}s expected=[suiteParams001,suiteParams002]',
        JSON.stringify(suiteValues));
      expect(suiteValues).assertDeepEquals(['suiteParams001', 'suiteParams002']);
      const keys: string[] = Object.keys(data).sort();
      hilog.info(0x0000, 'ParamExample', 'row keys=%{public}s expected=[name,suiteParams1,suiteParams2,value]',
        JSON.stringify(keys));
      expect(keys).assertDeepEquals(['name', 'suiteParams1', 'suiteParams2', 'value']);
      done();
    });
  });
}