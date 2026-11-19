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
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { EventCollector, logBegin, logEnd, logPair, logStep, sleep } from '../util/TestHelper';

const SUBSCRIBE_DELAY: number = 300;

/**
 * Verifies the publishing flows of the sample: publish data building and real event delivery.
 */
export default function publisherReal01Test() {
    describe('PublisherReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_PUBREAL_0001
         * @tc.name      testPublishFlow0001
         * @tc.desc      64 KiB 边界两侧与两个受支持数据判定同例校验
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testPublishFlow0001';
            logBegin(caseName);
            const limit: number = CommonEventConstants.MAX_EVENT_DATA_LENGTH;
            const atLimit: string = 'a'.repeat(limit);
            const overLimit: string = 'a'.repeat(limit + 1);
            logPair(caseName, 'length(atLimit)', atLimit.length.toString(), limit.toString());
            logPair(caseName, 'isDataLengthValid(atLimit)',
                CommonEventPublisher.isDataLengthValid(atLimit).toString(), 'true');
            expect(CommonEventPublisher.isDataLengthValid(atLimit)).assertTrue();
            logPair(caseName, 'isDataLengthValid(atLimit minus one)',
                CommonEventPublisher.isDataLengthValid(atLimit.substring(1)).toString(), 'true');
            expect(CommonEventPublisher.isDataLengthValid(atLimit.substring(1))).assertTrue();
            logPair(caseName, 'isDataLengthValid(overLimit)',
                CommonEventPublisher.isDataLengthValid(overLimit).toString(), 'false');
            expect(CommonEventPublisher.isDataLengthValid(overLimit)).assertFalse();
            logPair(caseName, 'isSupportedData(InApp)',
                CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_IN_APP).toString(), 'true');
            expect(CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_IN_APP)).assertTrue();
            expect(CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_OUT_APP)).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0002
         * @tc.name      testPublishFlow0002
         * @tc.desc      有序发布数据同时携带卡片来源码、InApp 数据与有序标记
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testPublishFlow0002';
            logBegin(caseName);
            const publishData: commonEventManager.CommonEventPublishData =
                CommonEventPublisher.buildPublishData(CommonEventConstants.DATA_IN_APP, EventSource.FORM, true);
            logPair(caseName, 'data', publishData.data ?? '', CommonEventConstants.DATA_IN_APP);
            expect(publishData.data).assertEqual(CommonEventConstants.DATA_IN_APP);
            logPair(caseName, 'code', (publishData.code ?? 0).toString(), EventSource.FORM.toString());
            expect(publishData.code).assertEqual(EventSource.FORM);
            logPair(caseName, 'isOrdered', (publishData.isOrdered ?? false).toString(), 'true');
            expect(publishData.isOrdered).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0003
         * @tc.name      testPublishFlow0003
         * @tc.desc      省略有序参数时按非有序事件构建发布数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testPublishFlow0003';
            logBegin(caseName);
            const publishData: commonEventManager.CommonEventPublishData =
                CommonEventPublisher.buildPublishData(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            logPair(caseName, 'isOrdered', (publishData.isOrdered ?? true).toString(), 'false');
            expect(publishData.isOrdered).assertFalse();
            logPair(caseName, 'code', (publishData.code ?? 0).toString(), EventSource.PAGE.toString());
            expect(publishData.code).assertEqual(EventSource.PAGE);
            logPair(caseName, 'data', publishData.data ?? '', CommonEventConstants.DATA_OUT_APP);
            expect(publishData.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0004
         * @tc.name      testPublishFlow0004
         * @tc.desc      大小写不一致、尾随空格与自定义数据均不被宿主接受
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testPublishFlow0004';
            logBegin(caseName);
            const rejected: string[] =
              ['inapp', 'OUTAPP', 'OutApp ', ' InApp', 'Custom', CommonEventConstants.EMPTY_VALUE];
            for (let index: number = 0; index < rejected.length; index++) {
                const supported: boolean = CommonEventPublisher.isSupportedData(rejected[index]);
                logPair(caseName, `isSupportedData(${rejected[index]})`, supported.toString(), 'false');
                expect(supported).assertFalse();
            }
            logPair(caseName, 'isSupportedData(OutApp)',
                CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_OUT_APP).toString(), 'true');
            expect(CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_OUT_APP)).assertTrue();
            logPair(caseName, 'isSupportedData(Outapp)',
                CommonEventPublisher.isSupportedData('Outapp').toString(), 'false');
            expect(CommonEventPublisher.isSupportedData('Outapp')).assertFalse();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0005
         * @tc.name      testPublishFlow0005
         * @tc.desc      事件名为空时发布被拒绝，空数据本身仍符合长度限制
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishFlow0005';
            logBegin(caseName);
            let rejected: boolean = false;
            let reason: string = '';
            try {
                await CommonEventPublisher.publishWithOptions(CommonEventConstants.EMPTY_VALUE,
                    CommonEventPublisher.buildPublishData(CommonEventConstants.DATA_IN_APP, EventSource.FORM));
            } catch (error) {
                rejected = true;
                reason = (error as Error).message;
            }
            logPair(caseName, 'rejected', rejected.toString(), 'true');
            expect(rejected).assertTrue();
            logPair(caseName, 'reason.length > 0', (reason.length > 0).toString(), 'true');
            expect(reason.length > 0).assertTrue();
            logPair(caseName, 'isDataLengthValid(empty)',
                CommonEventPublisher.isDataLengthValid(CommonEventConstants.EMPTY_VALUE).toString(), 'true');
            expect(CommonEventPublisher.isDataLengthValid(CommonEventConstants.EMPTY_VALUE)).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0006
         * @tc.name      testPublishFlow0006
         * @tc.desc      卡片来源发布的事件被订阅者收到并携带约定事件名
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishFlow0006';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.FORM);
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
         * @tc.number    SUB_CCER_PUBREAL_0007
         * @tc.name      testPublishFlow0007
         * @tc.desc      连续两次发布时订阅者按发布顺序收到两条事件
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishFlow0007';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.UNKNOWN);
                await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
                const received: boolean = await collector.waitForCount(2);
                logPair(caseName, 'received', received.toString(), 'true');
                expect(received).assertTrue();
                const first: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                const second: commonEventManager.CommonEventData | null = collector.getEventAt(1);
                logPair(caseName, 'first.data', first?.data ?? '', CommonEventConstants.DATA_IN_APP);
                expect(first?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
                logPair(caseName, 'second.data', second?.data ?? '', CommonEventConstants.DATA_OUT_APP);
                expect(second?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
                logPair(caseName, 'second.code', (second?.code ?? 0).toString(), EventSource.PAGE.toString());
                expect(second?.code).assertEqual(EventSource.PAGE);
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0008
         * @tc.name      testPublishFlow0008
         * @tc.desc      以有序方式发布的事件被订阅者收到且来源码保持页面来源
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishFlow0008';
            logBegin(caseName);
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.PAGE, true);
                const received: boolean = await collector.waitForCount(1);
                logPair(caseName, 'received', received.toString(), 'true');
                expect(received).assertTrue();
                const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_IN_APP);
                expect(event?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
                logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.PAGE.toString());
                expect(event?.code).assertEqual(EventSource.PAGE);
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0009
         * @tc.name      testPublishFlow0009
         * @tc.desc      收发两侧使用同一个约定事件名常量
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishFlow0009';
            logBegin(caseName);
            logPair(caseName, 'EVENT_NAME', CommonEventConstants.EVENT_NAME, 'Acts_CommonEvent_Test');
            expect(CommonEventConstants.EVENT_NAME).assertEqual('Acts_CommonEvent_Test');
            const collector: EventCollector = new EventCollector();
            await collector.start();
            await sleep(SUBSCRIBE_DELAY);
            try {
                await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
                const received: boolean = await collector.waitForCount(1);
                logStep(caseName, 'event published with the contract name');
                expect(received).assertTrue();
                const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
                logPair(caseName, 'event', event?.event ?? '', CommonEventConstants.EVENT_NAME);
                expect(event?.event).assertEqual(CommonEventConstants.EVENT_NAME);
                logPair(caseName, 'event.startsWith(Acts_)', (event?.event ?? '').startsWith('Acts_').toString(),
                  'true');
                expect((event?.event ?? '').startsWith('Acts_')).assertTrue();
            } finally {
                await collector.stop();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBREAL_0010
         * @tc.name      testPublishFlow0010
         * @tc.desc      四组数据与来源码组合构建出的发布数据字段互相匹配
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishFlow0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testPublishFlow0010';
            logBegin(caseName);
            const dataValues: string[] = [
                CommonEventConstants.DATA_IN_APP, CommonEventConstants.DATA_OUT_APP,
                CommonEventConstants.EMPTY_VALUE, 'Custom_Value'
            ];
            const sourceCodes: number[] = [EventSource.FORM, EventSource.PAGE, EventSource.UNKNOWN, -1];
            for (let index: number = 0; index < dataValues.length; index++) {
                const publishData: commonEventManager.CommonEventPublishData =
                    CommonEventPublisher.buildPublishData(dataValues[index], sourceCodes[index]);
                logPair(caseName, `combo[${index}]`, `${publishData.data ?? ''}|${publishData.code ?? 0}`,
                    `${dataValues[index]}|${sourceCodes[index]}`);
                expect(publishData.data).assertEqual(dataValues[index]);
                expect(publishData.code).assertEqual(sourceCodes[index]);
                expect(publishData.isOrdered).assertFalse();
            }
            logEnd(caseName);
        })
    })
}