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
import { commonEventManager } from '@kit.BasicServicesKit';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { FormEventService, ParseResult } from '../../../main/ets/feature/FormEventService';
import { EventCollector, logBegin, logEnd, logPair, sleep } from '../util/TestHelper';

const SUBSCRIBE_DELAY: number = 300;
const CLICK_MESSAGE: string = '{"message":"click","data":"OutApp"}';

/**
 * Verifies the widget message contract with parsed results and real event delivery.
 */
export default function parseReal01Test() {
    describe('ParseReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_PREAL_0001
         * @tc.name      testParseFlow0001
         * @tc.desc      卡片点击消息携带 OutApp 时解析成功
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testParseFlow0001';
            logBegin(caseName);
            const result: ParseResult = FormEventService.parseMessage(CLICK_MESSAGE);
            logPair(caseName, 'valid', result.valid.toString(), 'true');
            expect(result.valid).assertTrue();
            logPair(caseName, 'data', result.data, CommonEventConstants.DATA_OUT_APP);
            expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logPair(caseName, 'reason', result.reason, '');
            expect(result.reason).assertEqual('');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0002
         * @tc.name      testParseFlow0002
         * @tc.desc      卡片点击触发的事件被订阅者收到并携带卡片来源码
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testParseFlow0002';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await FormEventService.publishFromForm(CLICK_MESSAGE);
                const received: boolean = await collector.waitForCount(1);
                logPair(caseName, 'received', received.toString(), 'true');
                expect(received).assertTrue();
                const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_OUT_APP);
                expect(event?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
                logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.FORM.toString());
                expect(event?.code).assertEqual(EventSource.FORM);
                logPair(caseName, 'event', event?.event ?? '', CommonEventConstants.EVENT_NAME);
                expect(event?.event).assertEqual(CommonEventConstants.EVENT_NAME);
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0003
         * @tc.name      testParseFlow0003
         * @tc.desc      非法消息触发的事件仍以 OutApp 送达订阅者
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testParseFlow0003';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await FormEventService.publishFromForm('{');
                const received: boolean = await collector.waitForCount(1);
                logPair(caseName, 'received', received.toString(), 'true');
                expect(received).assertTrue();
                const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_OUT_APP);
                expect(event?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
                logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.FORM.toString());
                expect(event?.code).assertEqual(EventSource.FORM);
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0004
         * @tc.name      testParseFlow0004
         * @tc.desc      结构化解析与便捷方法对合法与非法消息给出相同数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testParseFlow0004';
            logBegin(caseName);
            const messages: string[] = ['{"data":"InApp"}', '{}', '{'];
            for (let index: number = 0; index < messages.length; index++) {
                const message: string = messages[index];
                const structured: string = FormEventService.parseMessage(message).data;
                const convenient: string = FormEventService.parseEventData(message);
                logPair(caseName, `message${index}`, structured, convenient);
                expect(structured).assertEqual(convenient);
            }
            logPair(caseName, 'evaluated', '3', '3');
            expect(FormEventService.parseEventData('{"data":"InApp"}'))
                .assertEqual(CommonEventConstants.DATA_IN_APP);
            logPair(caseName, 'missing-data reason', FormEventService.parseMessage('{}').reason, 'missing-data');
            expect(FormEventService.parseMessage('{}').reason).assertEqual('missing-data');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0005
         * @tc.name      testParseFlow0005
         * @tc.desc      点击消息缺少 data 字段时给出 missing-data 原因
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testParseFlow0005';
            logBegin(caseName);
            const result: ParseResult = FormEventService.parseMessage('{"message":"click"}');
            logPair(caseName, 'data', result.data, CommonEventConstants.DATA_OUT_APP);
            expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logPair(caseName, 'reason', result.reason, 'missing-data');
            expect(result.reason).assertEqual('missing-data');
            logPair(caseName, 'valid', result.valid.toString(), 'false');
            expect(result.valid).assertFalse();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0006
         * @tc.name      testParseFlow0006
         * @tc.desc      消息的 data 字段不是字符串时给出 non-string-data 原因
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testParseFlow0006';
            logBegin(caseName);
            const numbers: ParseResult = FormEventService.parseMessage('{"data":123}');
            logPair(caseName, 'numbers.reason', numbers.reason, 'non-string-data');
            expect(numbers.reason).assertEqual('non-string-data');
            const nullValue: ParseResult = FormEventService.parseMessage('{"data":null}');
            logPair(caseName, 'null.reason', nullValue.reason, 'non-string-data');
            expect(nullValue.reason).assertEqual('non-string-data');
            logPair(caseName, 'null.data', nullValue.data, CommonEventConstants.DATA_OUT_APP);
            expect(nullValue.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0007
         * @tc.name      testParseFlow0007
         * @tc.desc      64 KB 载荷解析成功且长度保持不变
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testParseFlow0007';
            logBegin(caseName);
            const limit: number = CommonEventConstants.MAX_EVENT_DATA_LENGTH;
            const message: string = `{"data":"${'a'.repeat(limit)}"}`;
            const result: ParseResult = FormEventService.parseMessage(message);
            logPair(caseName, 'valid', result.valid.toString(), 'true');
            expect(result.valid).assertTrue();
            logPair(caseName, 'length', result.data.length.toString(), limit.toString());
            expect(result.data.length).assertEqual(limit);
            logPair(caseName, 'reason', result.reason, '');
            expect(result.reason).assertEqual('');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0008
         * @tc.name      testParseFlow0008
         * @tc.desc      超过 64 KB 的载荷可解析但发布被拒绝
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testParseFlow0008';
            logBegin(caseName);
            const limit: number = CommonEventConstants.MAX_EVENT_DATA_LENGTH;
            const message: string = `{"data":"${'a'.repeat(limit + 1)}"}`;
            const result: ParseResult = FormEventService.parseMessage(message);
            logPair(caseName, 'valid', result.valid.toString(), 'true');
            expect(result.valid).assertTrue();
            logPair(caseName, 'length', result.data.length.toString(), (limit + 1).toString());
            expect(result.data.length).assertEqual(limit + 1);
            let rejected: boolean = false;
            try {
                await FormEventService.publishFromForm(message);
            } catch (error) {
                rejected = true;
                logPair(caseName, 'reason.length > 0', ((error as Error).message.length > 0).toString(), 'true');
                expect((error as Error).message.length > 0).assertTrue();
            }
            logPair(caseName, 'rejected', rejected.toString(), 'true');
            expect(rejected).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0009
         * @tc.name      testParseFlow0009
         * @tc.desc      中文与空格载荷按原样解析
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testParseFlow0009';
            logBegin(caseName);
            const chinese: ParseResult = FormEventService.parseMessage('{"data":"中文载荷"}');
            logPair(caseName, 'chinese.data', chinese.data, '中文载荷');
            expect(chinese.data).assertEqual('中文载荷');
            const spaced: ParseResult = FormEventService.parseMessage('{"data":" 空格 "}');
            logPair(caseName, 'spaced.data', spaced.data, ' 空格 ');
            expect(spaced.data).assertEqual(' 空格 ');
            logPair(caseName, 'spaced.length', spaced.data.length.toString(), '4');
            expect(spaced.data.length).assertEqual(4);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PREAL_0010
         * @tc.name      testParseFlow0010
         * @tc.desc      两次卡片点击按顺序送达两条事件
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testParseFlow0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testParseFlow0010';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await FormEventService.publishFromForm(CLICK_MESSAGE);
                await FormEventService.publishFromForm('{"data":"InApp"}');
                const received: boolean = await collector.waitForCount(2);
                logPair(caseName, 'received', received.toString(), 'true');
                expect(received).assertTrue();
                const first: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                const second: commonEventManager.CommonEventData | null = collector.getEventAt(1);
                logPair(caseName, 'first.data', first?.data ?? '', CommonEventConstants.DATA_OUT_APP);
                expect(first?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
                logPair(caseName, 'second.data', second?.data ?? '', CommonEventConstants.DATA_IN_APP);
                expect(second?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
                logPair(caseName, 'second.code', (second?.code ?? 0).toString(), EventSource.FORM.toString());
                expect(second?.code).assertEqual(EventSource.FORM);
                logEnd(caseName);
            } finally {
                await collector.stop();
            }
        })
    })
}