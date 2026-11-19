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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { formBindingData } from '@kit.FormKit';
import { FormEventService } from '../../../main/ets/feature/FormEventService';
import { FormPublishCounter } from '../../../main/ets/feature/FormPublishCounter';
import { FakeFormUpdater, bindingJson } from './util/ModelSupport';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

const MISSING: number = -1;

/**
 * Reads the publish count written into the real widget binding data.
 */
function readPublishCount(binding: formBindingData.FormBindingData): number {
    const json: string = bindingJson(binding);
    if (json.length === 0) {
        return MISSING;
    }
    const params: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
    const value: Object | undefined = params['publishCount'];
    if (value === undefined || typeof value !== 'number') {
        return MISSING;
    }
    return value as number;
}

/**
 * Verifies the widget publish counter together with the real binding data it feeds.
 */
export default function formCounterReal01Test() {
    describe('FormCounterReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_FCREAL_0001
         * @tc.name      testFormCounterFlow0001
         * @tc.desc      未发布过的卡片绑定数据携带计数 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0001';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            const binding: formBindingData.FormBindingData = FormEventService.createBindingData(counter.get('f1'));
            const count: number = readPublishCount(binding);
            logPair(caseName, 'publishCount', count.toString(), '0');
            expect(count).assertEqual(0);
            logPair(caseName, 'counter.get', counter.get('f1').toString(), '0');
            expect(counter.get('f1')).assertEqual(0);
            logPair(caseName, 'isValidPublishCount(0)', FormEventService.isValidPublishCount(count).toString(), 'true');
            expect(FormEventService.isValidPublishCount(count)).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0002
         * @tc.name      testFormCounterFlow0002
         * @tc.desc      连续两次递增后绑定数据携带最新计数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0002';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            const first: number = counter.increment('f1');
            logPair(caseName, 'first', first.toString(), '1');
            expect(first).assertEqual(1);
            const second: number = counter.increment('f1');
            logPair(caseName, 'second', second.toString(), '2');
            expect(second).assertEqual(2);
            const binding: formBindingData.FormBindingData = FormEventService.createBindingData(counter.get('f1'));
            const count: number = readPublishCount(binding);
            logPair(caseName, 'publishCount', count.toString(), '2');
            expect(count).assertEqual(2);
            logPair(caseName, 'counter.size', counter.size().toString(), '1');
            expect(counter.size()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0003
         * @tc.name      testFormCounterFlow0003
         * @tc.desc      卡片移除后计数与绑定数据同时归零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0003';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            counter.increment('f1');
            counter.increment('f1');
            const removed: boolean = counter.remove('f1');
            logPair(caseName, 'removed', removed.toString(), 'true');
            expect(removed).assertTrue();
            logPair(caseName, 'counter.get', counter.get('f1').toString(), '0');
            expect(counter.get('f1')).assertEqual(0);
            const binding: formBindingData.FormBindingData = FormEventService.createBindingData(counter.get('f1'));
            const count: number = readPublishCount(binding);
            logPair(caseName, 'publishCount', count.toString(), '0');
            expect(count).assertEqual(0);
            logPair(caseName, 'counter.size', counter.size().toString(), '0');
            expect(counter.size()).assertEqual(0);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0004
         * @tc.name      testFormCounterFlow0004
         * @tc.desc      清空计数器后所有卡片绑定数据回到初始计数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0004';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            counter.increment('f1');
            counter.increment('f2');
            counter.increment('f2');
            logPair(caseName, 'size before clear', counter.size().toString(), '2');
            expect(counter.size()).assertEqual(2);
            counter.clear();
            logPair(caseName, 'size after clear', counter.size().toString(), '0');
            expect(counter.size()).assertEqual(0);
            const count: number = readPublishCount(FormEventService.createBindingData(counter.get('f2')));
            logPair(caseName, 'publishCount after clear', count.toString(), '0');
            expect(count).assertEqual(0);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0005
         * @tc.name      testFormCounterFlow0005
         * @tc.desc      两张卡片的计数互不影响并能各自写入绑定数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0005';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            counter.increment('f1');
            counter.increment('f1');
            counter.increment('f1');
            counter.increment('f2');
            logPair(caseName, 'f1', counter.get('f1').toString(), '3');
            expect(counter.get('f1')).assertEqual(3);
            logPair(caseName, 'f2', counter.get('f2').toString(), '1');
            expect(counter.get('f2')).assertEqual(1);
            const first: number = readPublishCount(FormEventService.createBindingData(counter.get('f1')));
            const second: number = readPublishCount(FormEventService.createBindingData(counter.get('f2')));
            logPair(caseName, 'f1 publishCount', first.toString(), '3');
            expect(first).assertEqual(3);
            logPair(caseName, 'f2 publishCount', second.toString(), '1');
            expect(second).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0006
         * @tc.name      testFormCounterFlow0006
         * @tc.desc      计数达到上限后封顶，绑定数据不超过上限
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0006';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter(2);
            const first: number = counter.increment('f1');
            const second: number = counter.increment('f1');
            const third: number = counter.increment('f1');
            logPair(caseName, 'first', first.toString(), '1');
            expect(first).assertEqual(1);
            logPair(caseName, 'second', second.toString(), '2');
            expect(second).assertEqual(2);
            logPair(caseName, 'third', third.toString(), '2');
            expect(third).assertEqual(2);
            const count: number = readPublishCount(FormEventService.createBindingData(counter.get('f1')));
            logPair(caseName, 'publishCount', count.toString(), '2');
            expect(count).assertEqual(2);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0007
         * @tc.name      testFormCounterFlow0007
         * @tc.desc      刷新目标收到卡片标识与真实绑定数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormCounterFlow0007';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            const updater: FakeFormUpdater = new FakeFormUpdater(false);
            counter.increment('f7');
            counter.increment('f7');
            await updater.updateForm('f7', FormEventService.createBindingData(counter.get('f7')));
            logPair(caseName, 'updater.count', updater.getCount().toString(), '1');
            expect(updater.getCount()).assertEqual(1);
            logPair(caseName, 'updater.formId', updater.getLastFormId(), 'f7');
            expect(updater.getLastFormId()).assertEqual('f7');
            logPair(caseName, 'updater.json', updater.getLastJson(), '{"publishCount":2}');
            expect(updater.getLastJson()).assertContain('"publishCount":2');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0008
         * @tc.name      testFormCounterFlow0008
         * @tc.desc      刷新失败被拒绝但不回退计数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormCounterFlow0008';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            const updater: FakeFormUpdater = new FakeFormUpdater(true);
            counter.increment('f8');
            let rejected: boolean = false;
            try {
                await updater.updateForm('f8', FormEventService.createBindingData(counter.get('f8')));
            } catch (error) {
                rejected = true;
                logPair(caseName, 'reason.length > 0', ((error as Error).message.length > 0).toString(), 'true');
                expect((error as Error).message.length > 0).assertTrue();
            }
            logPair(caseName, 'rejected', rejected.toString(), 'true');
            expect(rejected).assertTrue();
            logPair(caseName, 'counter.get', counter.get('f8').toString(), '1');
            expect(counter.get('f8')).assertEqual(1);
            logPair(caseName, 'updater.count', updater.getCount().toString(), '1');
            expect(updater.getCount()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0009
         * @tc.name      testFormCounterFlow0009
         * @tc.desc      重复移除同一卡片时第二次返回未命中
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0009';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter();
            counter.increment('f9');
            const first: boolean = counter.remove('f9');
            const second: boolean = counter.remove('f9');
            logPair(caseName, 'first', first.toString(), 'true');
            expect(first).assertTrue();
            logPair(caseName, 'second', second.toString(), 'false');
            expect(second).assertFalse();
            logPair(caseName, 'counter.get', counter.get('f9').toString(), '0');
            expect(counter.get('f9')).assertEqual(0);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FCREAL_0010
         * @tc.name      testFormCounterFlow0010
         * @tc.desc      最大安全整数计数可写入绑定数据并通过合法性校验
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormCounterFlow0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormCounterFlow0010';
            logBegin(caseName);
            const counter: FormPublishCounter = new FormPublishCounter(Number.MAX_SAFE_INTEGER);
            counter.increment('f10');
            const next: number = counter.increment('f10');
            logPair(caseName, 'next', next.toString(), '2');
            expect(next).assertEqual(2);
            const binding: formBindingData.FormBindingData =
              FormEventService.createBindingData(Number.MAX_SAFE_INTEGER);
            const count: number = readPublishCount(binding);
            logPair(caseName, 'publishCount', count.toString(), Number.MAX_SAFE_INTEGER.toString());
            expect(count).assertEqual(Number.MAX_SAFE_INTEGER);
            logPair(caseName, 'isValidPublishCount(max)', FormEventService.isValidPublishCount(count).toString(),
              'true');
            expect(FormEventService.isValidPublishCount(count)).assertTrue();
            logEnd(caseName);
        })
    })
}