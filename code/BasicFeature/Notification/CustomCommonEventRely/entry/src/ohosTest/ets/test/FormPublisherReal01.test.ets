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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { FormEventService, ParseResult } from '../../../main/ets/feature/FormEventService';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { FakePublisher, defaultFormPublisher } from './util/ModelSupport';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

/**
 * Verifies the injected form event publisher on the real publish and restore paths.
 */
export default function formPublisherReal01Test() {
    describe('FormPublisherReal01Test', () => {
        afterEach(() => {
            FormEventService.setPublisher(defaultFormPublisher());
        });

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0001
         * @tc.name      testFormPublisherReal0001
         * @tc.desc      注入捕获恢复默认再注入的往返链路数据与来源码一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0001';
            logBegin(caseName);
            const first: FakePublisher = new FakePublisher(false);
            FormEventService.setPublisher(first);
            await FormEventService.publishFromForm('{"data":"OutApp"}');
            logPair(caseName, 'first data', first.getLastData(), CommonEventConstants.DATA_OUT_APP);
            expect(first.getLastData()).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logPair(caseName, 'first source', first.getLastSourceCode().toString(), '1001');
            expect(first.getLastSourceCode()).assertEqual(EventSource.FORM);
            FormEventService.setPublisher(defaultFormPublisher());
            const second: FakePublisher = new FakePublisher(false);
            FormEventService.setPublisher(second);
            await FormEventService.publishFromForm('{"data":"InApp"}');
            logPair(caseName, 'second data', second.getLastData(), CommonEventConstants.DATA_IN_APP);
            expect(second.getLastData()).assertEqual(CommonEventConstants.DATA_IN_APP);
            logPair(caseName, 'first untouched', first.getCalls().toString(), '1');
            expect(first.getCalls()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0002
         * @tc.name      testFormPublisherReal0002
         * @tc.desc      拒绝型注入发布器的异常经等待后原样传播且调用已计数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0002';
            logBegin(caseName);
            const failing: FakePublisher = new FakePublisher(true);
            FormEventService.setPublisher(failing);
            let caughtMessage: string = '';
            try {
                await FormEventService.publishFromForm('{"data":"OutApp"}');
            } catch (error) {
                caughtMessage = (error as Error).message;
            }
            logPair(caseName, 'caught message', caughtMessage, 'publish failed');
            expect(caughtMessage).assertEqual('publish failed');
            logPair(caseName, 'call recorded', failing.getCalls().toString(), '1');
            expect(failing.getCalls()).assertEqual(1);
            logPair(caseName, 'parsed data', failing.getLastData(), CommonEventConstants.DATA_OUT_APP);
            expect(failing.getLastData()).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0003
         * @tc.name      testFormPublisherReal0003
         * @tc.desc      合法卡片消息经注入发布器发布解析出的应用内数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0003';
            logBegin(caseName);
            const fake: FakePublisher = new FakePublisher(false);
            FormEventService.setPublisher(fake);
            await FormEventService.publishFromForm('{"data":"InApp"}');
            logPair(caseName, 'data', fake.getLastData(), CommonEventConstants.DATA_IN_APP);
            expect(fake.getLastData()).assertEqual(CommonEventConstants.DATA_IN_APP);
            logPair(caseName, 'source', fake.getLastSourceCode().toString(), '1001');
            expect(fake.getLastSourceCode()).assertEqual(EventSource.FORM);
            logPair(caseName, 'calls', fake.getCalls().toString(), '1');
            expect(fake.getCalls()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0004
         * @tc.name      testFormPublisherReal0004
         * @tc.desc      非法卡片消息回退应用外数据后仍经注入发布器发布
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0004';
            logBegin(caseName);
            const fake: FakePublisher = new FakePublisher(false);
            FormEventService.setPublisher(fake);
            await FormEventService.publishFromForm('not-a-json');
            logPair(caseName, 'fallback data', fake.getLastData(), CommonEventConstants.DATA_OUT_APP);
            expect(fake.getLastData()).assertEqual(CommonEventConstants.DATA_OUT_APP);
            await FormEventService.publishFromForm('');
            logPair(caseName, 'calls after empty', fake.getCalls().toString(), '2');
            expect(fake.getCalls()).assertEqual(2);
            logPair(caseName, 'empty fallback', fake.getLastData(), CommonEventConstants.DATA_OUT_APP);
            expect(fake.getLastData()).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0005
         * @tc.name      testFormPublisherReal0005
         * @tc.desc      连续多次发布经注入发布器逐次捕获且末次数据正确
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0005';
            logBegin(caseName);
            const fake: FakePublisher = new FakePublisher(false);
            FormEventService.setPublisher(fake);
            await FormEventService.publishFromForm('{"data":"InApp"}');
            await FormEventService.publishFromForm('{"data":"OutApp"}');
            await FormEventService.publishFromForm('{"data":"InApp"}');
            logPair(caseName, 'calls', fake.getCalls().toString(), '3');
            expect(fake.getCalls()).assertEqual(3);
            logPair(caseName, 'last data', fake.getLastData(), CommonEventConstants.DATA_IN_APP);
            expect(fake.getLastData()).assertEqual(CommonEventConstants.DATA_IN_APP);
            logPair(caseName, 'stable source', fake.getLastSourceCode().toString(), '1001');
            expect(fake.getLastSourceCode()).assertEqual(EventSource.FORM);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0006
         * @tc.name      testFormPublisherReal0006
         * @tc.desc      恢复默认发布器后合法消息经真实公共事件框架发布成功
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0006';
            logBegin(caseName);
            FormEventService.setPublisher(defaultFormPublisher());
            const parsed: string = FormEventService.parseEventData('{"data":"InApp"}');
            logPair(caseName, 'parsed data', parsed, CommonEventConstants.DATA_IN_APP);
            expect(parsed).assertEqual(CommonEventConstants.DATA_IN_APP);
            const pending: Promise<void> = FormEventService.publishFromForm('{"data":"InApp"}');
            logPair(caseName, 'is promise', String(pending instanceof Promise), 'true');
            expect(pending instanceof Promise).assertTrue();
            await pending;
            const result: ParseResult = FormEventService.parseMessage('{"data":"InApp"}');
            logPair(caseName, 'parsed valid', result.valid.toString(), 'true');
            expect(result.valid).assertTrue();
            logPair(caseName, 'parsed reason', result.reason, '');
            expect(result.reason).assertEqual('');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0007
         * @tc.name      testFormPublisherReal0007
         * @tc.desc      拒绝后恢复默认链路再次发布无失败残留
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0007';
            logBegin(caseName);
            const failing: FakePublisher = new FakePublisher(true);
            FormEventService.setPublisher(failing);
            let caughtMessage: string = '';
            try {
                await FormEventService.publishFromForm('{"data":"OutApp"}');
            } catch (error) {
                caughtMessage = (error as Error).message;
            }
            logPair(caseName, 'rejected first', String(caughtMessage.length > 0), 'true');
            expect(caughtMessage.length > 0).assertTrue();
            FormEventService.setPublisher(defaultFormPublisher());
            await FormEventService.publishFromForm('{"data":"OutApp"}');
            const result: ParseResult = FormEventService.parseMessage('{"data":"OutApp"}');
            logPair(caseName, 'retry valid', result.valid.toString(), 'true');
            expect(result.valid).assertTrue();
            logPair(caseName, 'retry data', result.data, CommonEventConstants.DATA_OUT_APP);
            expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logPair(caseName, 'failing untouched again', failing.getCalls().toString(), '1');
            expect(failing.getCalls()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMPUBREAL_0008
         * @tc.name      testFormPublisherReal0008
         * @tc.desc      卡片发布入口返回真实 Promise 且等待后正常落定
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormPublisherReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormPublisherReal0008';
            logBegin(caseName);
            const fake: FakePublisher = new FakePublisher(false);
            FormEventService.setPublisher(fake);
            const pending: Promise<void> = FormEventService.publishFromForm('{"data":"OutApp"}');
            logPair(caseName, 'is promise', String(pending instanceof Promise), 'true');
            expect(pending instanceof Promise).assertTrue();
            await pending;
            logPair(caseName, 'calls', fake.getCalls().toString(), '1');
            expect(fake.getCalls()).assertEqual(1);
            logPair(caseName, 'data', fake.getLastData(), CommonEventConstants.DATA_OUT_APP);
            expect(fake.getLastData()).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logEnd(caseName);
        })
    })
}
