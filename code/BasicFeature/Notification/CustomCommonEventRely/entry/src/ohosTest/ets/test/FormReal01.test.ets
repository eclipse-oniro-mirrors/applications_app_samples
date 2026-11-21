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
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
import { FormEventService } from '../../../main/ets/feature/FormEventService';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { EventCollector, logBegin, logEnd, logPair, logStep, sleep } from '../util/TestHelper';

const SUBSCRIBE_DELAY: number = 300;

/**
 * Verifies the service widget flows: card message parsing, binding data and publishing from a card.
 */
export default function formReal01Test() {
    describe('FormReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_FORMREAL_0001
         * @tc.name      testFormFlow0001
         * @tc.desc      卡片点击消息解析后发布，订阅者收到 InApp 与卡片来源码
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormFlow0001';
            logBegin(caseName);
            const message: string = '{"message":"click","data":"InApp"}';
            const parsed: string = FormEventService.parseEventData(message);
            logPair(caseName, 'parseEventData', parsed, CommonEventConstants.DATA_IN_APP);
            expect(parsed).assertEqual(CommonEventConstants.DATA_IN_APP);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await FormEventService.publishFromForm(message);
                const received: boolean = await collector.waitForCount(1);
                logPair(caseName, 'received', received.toString(), 'true');
                expect(received).assertTrue();
                const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_IN_APP);
                expect(event?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
                logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.FORM.toString());
                expect(event?.code).assertEqual(EventSource.FORM);
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0002
         * @tc.name      testFormFlow0002
         * @tc.desc      空消息回落为 OutApp 且该值属于宿主可接受的数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormFlow0002';
            logBegin(caseName);
            const parsed: string = FormEventService.parseEventData(CommonEventConstants.EMPTY_VALUE);
            logPair(caseName, 'parseEventData(empty)', parsed, CommonEventConstants.DATA_OUT_APP);
            expect(parsed).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logPair(caseName, 'parsed.length', parsed.length.toString(),
              CommonEventConstants.DATA_OUT_APP.length.toString());
            expect(parsed.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
            logPair(caseName, 'isSupportedData', CommonEventPublisher.isSupportedData(parsed).toString(), 'true');
            expect(CommonEventPublisher.isSupportedData(parsed)).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0003
         * @tc.name      testFormFlow0003
         * @tc.desc      合法卡片数据经发布链路送达订阅者且不经过界面
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormFlow0003';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await FormEventService.publishFromForm('{"data":"InApp"}');
                logStep(caseName, 'published from the card path');
                const received: boolean = await collector.waitForCount(1);
                expect(received).assertTrue();
                const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_IN_APP);
                expect(event?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
                logPair(caseName, 'event', event?.event ?? '', CommonEventConstants.EVENT_NAME);
                expect(event?.event).assertEqual(CommonEventConstants.EVENT_NAME);
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0004
         * @tc.name      testFormFlow0004
         * @tc.desc      非法卡片消息回落为 OutApp 后仍以卡片来源发布
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormFlow0004';
            logBegin(caseName);
            const brokenMessage: string = '{"data":';
            logPair(caseName, 'parseEventData(broken)', FormEventService.parseEventData(brokenMessage),
                CommonEventConstants.DATA_OUT_APP);
            expect(FormEventService.parseEventData(brokenMessage)).assertEqual(CommonEventConstants.DATA_OUT_APP);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await FormEventService.publishFromForm(brokenMessage);
                const received: boolean = await collector.waitForCount(1);
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
         * @tc.number    SUB_CCER_FORMREAL_0005
         * @tc.name      testFormFlow0005
         * @tc.desc      发布次数 0、1、20 写入卡片绑定数据时结构与数值均正确
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormFlow0005';
            logBegin(caseName);
            const zero: string = String(FormEventService.createBindingData(0).data);
            logPair(caseName, 'bindingData(0)', zero, '{"publishCount":0}');
            expect(zero).assertEqual('{"publishCount":0}');
            const one: string = String(FormEventService.createBindingData(1).data);
            expect(one).assertEqual('{"publishCount":1}');
            const twenty: string =
              String(FormEventService.createBindingData(CommonEventConstants.MAX_RECORD_COUNT).data);
            logPair(caseName, 'bindingData(20)', twenty, '{"publishCount":20}');
            expect(twenty).assertEqual('{"publishCount":20}');
            expect(twenty).assertContain(CommonEventConstants.FORM_COUNT_KEY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0006
         * @tc.name      testFormFlow0006
         * @tc.desc      绑定计数与消息解析在同一流程中互不影响
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormFlow0006';
            logBegin(caseName);
            const binding: string = String(FormEventService.createBindingData(7).data);
            logPair(caseName, 'bindingData(7)', binding, '{"publishCount":7}');
            expect(binding).assertContain('"publishCount":7');
            const parsed: string = FormEventService.parseEventData('{"data":"InApp"}');
            logPair(caseName, 'parseEventData', parsed, CommonEventConstants.DATA_IN_APP);
            expect(parsed).assertEqual(CommonEventConstants.DATA_IN_APP);
            logPair(caseName, 'bindingData unchanged', binding, '{"publishCount":7}');
            expect(binding).assertContain(CommonEventConstants.FORM_COUNT_KEY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0007
         * @tc.name      testFormFlow0007
         * @tc.desc      卡片数据前后空格原样保留且不被识别为宿主约定值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormFlow0007';
            logBegin(caseName);
            const parsed: string = FormEventService.parseEventData('{"data":"  Value  "}');
            logPair(caseName, 'parseEventData(padded)', parsed, '  Value  ');
            expect(parsed).assertEqual('  Value  ');
            logPair(caseName, 'parsed.length', parsed.length.toString(), '9');
            expect(parsed.length).assertEqual(9);
            logPair(caseName, 'isSupportedData', CommonEventPublisher.isSupportedData(parsed).toString(), 'false');
            expect(CommonEventPublisher.isSupportedData(parsed)).assertFalse();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0008
         * @tc.name      testFormFlow0008
         * @tc.desc      卡片连续发布两次时订阅者按顺序收到两条不同数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testFormFlow0008';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await FormEventService.publishFromForm('{"data":"InApp"}');
                await FormEventService.publishFromForm('{"data":"OutApp"}');
                const received: boolean = await collector.waitForCount(2);
                logPair(caseName, 'received', received.toString(), 'true');
                expect(received).assertTrue();
                const first: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                const second: commonEventManager.CommonEventData | null = collector.getEventAt(1);
                logPair(caseName, 'first.data', first?.data ?? '', CommonEventConstants.DATA_IN_APP);
                expect(first?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
                logPair(caseName, 'second.data', second?.data ?? '', CommonEventConstants.DATA_OUT_APP);
                expect(second?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
                logPair(caseName, 'second.code', (second?.code ?? 0).toString(), EventSource.FORM.toString());
                expect(second?.code).assertEqual(EventSource.FORM);
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0009
         * @tc.name      testFormFlow0009
         * @tc.desc      卡片绑定字段名与宿主约定常量保持一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormFlow0009';
            logBegin(caseName);
            logPair(caseName, 'FORM_COUNT_KEY', CommonEventConstants.FORM_COUNT_KEY, 'publishCount');
            expect(CommonEventConstants.FORM_COUNT_KEY).assertEqual('publishCount');
            logPair(caseName, 'FORM_MESSAGE_KEY', CommonEventConstants.FORM_MESSAGE_KEY, 'message');
            expect(CommonEventConstants.FORM_MESSAGE_KEY).assertEqual('message');
            const binding: string = JSON.stringify(FormEventService.createBindingData(3));
            logPair(caseName, 'bindingData(3)', binding, '{"data":{"publishCount":3}}');
            expect(binding).assertContain(CommonEventConstants.FORM_COUNT_KEY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_FORMREAL_0010
         * @tc.name      testFormFlow0010
         * @tc.desc      卡片消息键名大小写敏感，不一致时回落到 OutApp
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testFormFlow0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testFormFlow0010';
            logBegin(caseName);
            const upperKey: string = FormEventService.parseEventData('{"Data":"InApp"}');
            logPair(caseName, 'Data key', upperKey, CommonEventConstants.DATA_OUT_APP);
            expect(upperKey).assertEqual(CommonEventConstants.DATA_OUT_APP);
            const spacedKey: string = FormEventService.parseEventData('{" data":"InApp"}');
            expect(spacedKey).assertEqual(CommonEventConstants.DATA_OUT_APP);
            const exactKey: string = FormEventService.parseEventData('{"data":"OutApp"}');
            logPair(caseName, 'data key', exactKey, CommonEventConstants.DATA_OUT_APP);
            expect(exactKey).assertEqual(CommonEventConstants.DATA_OUT_APP);
            expect(CommonEventPublisher.isSupportedData(exactKey)).assertTrue();
            logEnd(caseName);
        })
    })
}