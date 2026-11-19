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
import { CommonEventPublisher, PublishOptions, PublishRequest } from '../../../main/ets/feature/CommonEventPublisher';
import { FormEventService } from '../../../main/ets/feature/FormEventService';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

/**
 * Verifies the parameterized publish entry points on the real framework path.
 */
export default function publishOptionsReal01Test() {
    describe('PublishOptionsReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0001
         * @tc.name      testPublishOptionsReal0001
         * @tc.desc      四字段自定义请求组装校验后经真实框架发布成功
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0001';
            logBegin(caseName);
            const options: PublishOptions =
                { data: 'Real 锚点数据', sourceCode: 1003, eventName: 'anchor', ordered: true };
            const request: PublishRequest = CommonEventPublisher.buildRequest(options);
            logPair(caseName, 'event name', request.eventName, 'anchor');
            expect(request.eventName).assertEqual('anchor');
            const code: number = request.publishData.code ?? 0;
            logPair(caseName, 'source code', code.toString(), '1003');
            expect(code).assertEqual(1003);
            const ordered: boolean = request.publishData.isOrdered ?? false;
            logPair(caseName, 'ordered', ordered.toString(), 'true');
            expect(ordered).assertTrue();
            logPair(caseName, 'validation', CommonEventPublisher.validatePublishRequest(
                request.eventName, request.publishData), '');
            expect(CommonEventPublisher.validatePublishRequest(
                request.eventName, request.publishData)).assertEqual('');
            await CommonEventPublisher.publishWith(options);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0002
         * @tc.name      testPublishOptionsReal0002
         * @tc.desc      省略事件名与有序参数的请求走默认值并经真实框架发布成功
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0002';
            logBegin(caseName);
            const options: PublishOptions =
                { data: CommonEventConstants.DATA_IN_APP, sourceCode: EventSource.PAGE };
            const request: PublishRequest = CommonEventPublisher.buildRequest(options);
            logPair(caseName, 'default name', request.eventName, CommonEventConstants.EVENT_NAME);
            expect(request.eventName).assertEqual(CommonEventConstants.EVENT_NAME);
            const defaultOrdered: boolean = request.publishData.isOrdered ?? true;
            logPair(caseName, 'default ordered', defaultOrdered.toString(), 'false');
            expect(defaultOrdered).assertFalse();
            await CommonEventPublisher.publishWith(options);
            logPair(caseName, 'published', request.publishData.data ?? '', CommonEventConstants.DATA_IN_APP);
            expect(request.publishData.data).assertEqual(CommonEventConstants.DATA_IN_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0003
         * @tc.name      testPublishOptionsReal0003
         * @tc.desc      空事件名的请求经发布链路异步拒绝并给出空名原因
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0003';
            logBegin(caseName);
            const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: '' };
            const request: PublishRequest = CommonEventPublisher.buildRequest(options);
            let reason: string = '';
            try {
                await CommonEventPublisher.publishWith(options);
            } catch (error) {
                reason = (error as Error).message;
            }
            logPair(caseName, 'reject reason', reason, 'The common event name must not be empty.');
            expect(reason).assertEqual('The common event name must not be empty.');
            logPair(caseName, 'passthrough name', request.eventName, '');
            expect(request.eventName).assertEqual('');
            logPair(caseName, 'validation reason', CommonEventPublisher.validatePublishRequest(
                request.eventName, request.publishData), reason);
            expect(CommonEventPublisher.validatePublishRequest(
                request.eventName, request.publishData)).assertEqual(reason);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0004
         * @tc.name      testPublishOptionsReal0004
         * @tc.desc      首尾带空格事件名的请求经发布链路异步拒绝并给出空格原因
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0004';
            logBegin(caseName);
            const options: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: ' spaced ' };
            let reason: string = '';
            try {
                await CommonEventPublisher.publishWith(options);
            } catch (error) {
                reason = (error as Error).message;
            }
            logPair(caseName, 'reject reason', reason, 'The common event name must not start or end with spaces.');
            expect(reason).assertEqual('The common event name must not start or end with spaces.');
            logPair(caseName, 'kept name', options.eventName ?? '', ' spaced ');
            expect(options.eventName ?? '').assertEqual(' spaced ');
            logPair(caseName, 'reason length', reason.length.toString(), '56');
            expect(reason.length).assertEqual(56);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0005
         * @tc.name      testPublishOptionsReal0005
         * @tc.desc      超过 64 KB 数据的请求经发布链路异步拒绝并给出长度原因
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0005';
            logBegin(caseName);
            const options: PublishOptions = { data: 'x'.repeat(65537), sourceCode: 1002 };
            let reason: string = '';
            try {
                await CommonEventPublisher.publishWith(options);
            } catch (error) {
                reason = (error as Error).message;
            }
            logPair(caseName, 'reject reason', reason, 'The event data must not exceed 64 KB.');
            expect(reason).assertEqual('The event data must not exceed 64 KB.');
            logPair(caseName, 'data length', options.data.length.toString(), '65537');
            expect(options.data.length).assertEqual(65537);
            logPair(caseName, 'boundary valid', String(CommonEventPublisher.isDataLengthValid('x'.repeat(65536))),
                'true');
            expect(CommonEventPublisher.isDataLengthValid('x'.repeat(65536))).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0006
         * @tc.name      testPublishOptionsReal0006
         * @tc.desc      显式有序请求经真实框架以有序事件发布成功
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0006';
            logBegin(caseName);
            const options: PublishOptions =
                { data: CommonEventConstants.DATA_OUT_APP, sourceCode: EventSource.FORM, ordered: true };
            const request: PublishRequest = CommonEventPublisher.buildRequest(options);
            const orderedFlag: boolean = request.publishData.isOrdered ?? false;
            logPair(caseName, 'ordered flag', orderedFlag.toString(), 'true');
            expect(orderedFlag).assertTrue();
            const formCode: number = request.publishData.code ?? 0;
            logPair(caseName, 'source code', formCode.toString(), '1001');
            expect(formCode).assertEqual(1001);
            await CommonEventPublisher.publishWith(options);
            logPair(caseName, 'data', request.publishData.data ?? '', CommonEventConstants.DATA_OUT_APP);
            expect(request.publishData.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0007
         * @tc.name      testPublishOptionsReal0007
         * @tc.desc      拒绝后的下一次合法发布不受失败残留影响
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0007';
            logBegin(caseName);
            const bad: PublishOptions = { data: 'InApp', sourceCode: 1002, eventName: '' };
            let reason: string = '';
            try {
                await CommonEventPublisher.publishWith(bad);
            } catch (error) {
                reason = (error as Error).message;
            }
            logPair(caseName, 'first rejected', String(reason.length > 0), 'true');
            expect(reason.length > 0).assertTrue();
            const good: PublishOptions =
                { data: CommonEventConstants.DATA_IN_APP, sourceCode: EventSource.PAGE };
            await CommonEventPublisher.publishWith(good);
            const retry: PublishRequest = CommonEventPublisher.buildRequest(good);
            logPair(caseName, 'retry request', retry.eventName, CommonEventConstants.EVENT_NAME);
            expect(retry.eventName).assertEqual(CommonEventConstants.EVENT_NAME);
            logPair(caseName, 'retry validation', CommonEventPublisher.validatePublishRequest(
                retry.eventName, retry.publishData), '');
            expect(CommonEventPublisher.validatePublishRequest(
                retry.eventName, retry.publishData)).assertEqual('');
            logPair(caseName, 'retry data', retry.publishData.data ?? '', CommonEventConstants.DATA_IN_APP);
            expect(retry.publishData.data).assertEqual(CommonEventConstants.DATA_IN_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0008
         * @tc.name      testPublishOptionsReal0008
         * @tc.desc      省略事件名与显式默认事件名两次组装结果逐字段等价
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testPublishOptionsReal0008';
            logBegin(caseName);
            const omitted: PublishOptions = { data: 'InApp', sourceCode: 1002 };
            const explicit: PublishOptions =
                { data: 'InApp', sourceCode: 1002, eventName: CommonEventConstants.EVENT_NAME };
            const first: PublishRequest = CommonEventPublisher.buildRequest(omitted);
            const second: PublishRequest = CommonEventPublisher.buildRequest(explicit);
            logPair(caseName, 'event names', first.eventName, second.eventName);
            expect(first.eventName).assertEqual(second.eventName);
            const firstCode: number = first.publishData.code ?? 0;
            const secondCode: number = second.publishData.code ?? 0;
            logPair(caseName, 'codes', firstCode.toString(), secondCode.toString());
            expect(firstCode).assertEqual(secondCode);
            logPair(caseName, 'data', first.publishData.data ?? '', second.publishData.data ?? '');
            expect(first.publishData.data).assertEqual(second.publishData.data);
            const firstOrdered: boolean = first.publishData.isOrdered ?? false;
            const secondOrdered: boolean = second.publishData.isOrdered ?? false;
            logPair(caseName, 'ordered', firstOrdered.toString(), secondOrdered.toString());
            expect(firstOrdered).assertEqual(secondOrdered);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0009
         * @tc.name      testPublishOptionsReal0009
         * @tc.desc      卡片消息解析出的数据经参数化发布入口真实发布成功
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0009';
            logBegin(caseName);
            const data: string = FormEventService.parseEventData('{"data":"OutApp"}');
            logPair(caseName, 'parsed data', data, CommonEventConstants.DATA_OUT_APP);
            expect(data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            const options: PublishOptions = { data: data, sourceCode: EventSource.FORM };
            const request: PublishRequest = CommonEventPublisher.buildRequest(options);
            logPair(caseName, 'assembled data', request.publishData.data ?? '', data);
            expect(request.publishData.data).assertEqual(data);
            await CommonEventPublisher.publishWith(options);
            logPair(caseName, 'published once', request.eventName, CommonEventConstants.EVENT_NAME);
            expect(request.eventName).assertEqual(CommonEventConstants.EVENT_NAME);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_PUBOPTREAL_0010
         * @tc.name      testPublishOptionsReal0010
         * @tc.desc      同一合法请求连续两次经真实框架发布均成功
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testPublishOptionsReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testPublishOptionsReal0010';
            logBegin(caseName);
            const options: PublishOptions =
                { data: CommonEventConstants.DATA_IN_APP, sourceCode: EventSource.PAGE };
            const request: PublishRequest = CommonEventPublisher.buildRequest(options);
            await CommonEventPublisher.publishWith(options);
            await CommonEventPublisher.publishWith(options);
            logPair(caseName, 'stable name', request.eventName, CommonEventConstants.EVENT_NAME);
            expect(request.eventName).assertEqual(CommonEventConstants.EVENT_NAME);
            logPair(caseName, 'stable data', request.publishData.data ?? '', CommonEventConstants.DATA_IN_APP);
            expect(request.publishData.data).assertEqual(CommonEventConstants.DATA_IN_APP);
            const stableOrdered: boolean = request.publishData.isOrdered ?? true;
            logPair(caseName, 'stable ordered', stableOrdered.toString(), 'false');
            expect(stableOrdered).assertFalse();
            logEnd(caseName);
        })
    })
}
