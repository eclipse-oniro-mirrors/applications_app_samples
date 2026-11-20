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
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { EventRecord, EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { HomeSnapshot, HomeStateModel, HomeStatus } from '../../../main/ets/feature/HomeStateModel';
import { FakePublisher } from './util/ModelSupport';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

/**
 * Verifies the home page state machine: real publish, record keeping and state transitions.
 */
export default function homeModelReal01Test() {
    describe('HomeModelReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_HMREAL_0001
         * @tc.name      testHomeModelFlow0001
         * @tc.desc      新建模型的状态为 READY 且没有任何记录
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testHomeModelFlow0001';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel();
            const snapshot: HomeSnapshot = model.snapshot();
            logPair(caseName, 'status', snapshot.status.toString(), HomeStatus.READY.toString());
            expect(snapshot.status).assertEqual(HomeStatus.READY);
            logPair(caseName, 'count', snapshot.count.toString(), '0');
            expect(snapshot.count).assertEqual(0);
            logPair(caseName, 'lastSource', snapshot.lastSource.toString(), HomeStateModel.NO_SOURCE.toString());
            expect(snapshot.lastSource).assertEqual(HomeStateModel.NO_SOURCE);
            logPair(caseName, 'firstSequence', snapshot.firstSequence.toString(), '-1');
            expect(snapshot.firstSequence).assertEqual(-1);
            logPair(caseName, 'lastSequence', snapshot.lastSequence.toString(), '-1');
            expect(snapshot.lastSequence).assertEqual(-1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0002
         * @tc.name      testHomeModelFlow0002
         * @tc.desc      首页发布走真实公共事件通道，成功后状态为发布成功且不再占用发布中
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeModelFlow0002';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel();
            const succeeded: boolean = await model.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            logPair(caseName, 'succeeded', succeeded.toString(), 'true');
            expect(succeeded).assertTrue();
            logPair(caseName, 'status', model.getStatus().toString(), HomeStatus.PUBLISH_SUCCESS.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.PUBLISH_SUCCESS);
            logPair(caseName, 'operating', model.isOperating().toString(), 'false');
            expect(model.isOperating()).assertFalse();
            logPair(caseName, 'count', model.getReceivedCount().toString(), '0');
            expect(model.getReceivedCount()).assertEqual(0);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0003
         * @tc.name      testHomeModelFlow0003
         * @tc.desc      发布失败时状态为发布失败且发布中标记已释放
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeModelFlow0003';
            logBegin(caseName);
            const publisher: FakePublisher = new FakePublisher(true);
            const model: HomeStateModel = new HomeStateModel(new EventRecordManager(), publisher);
            const succeeded: boolean = await model.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            logPair(caseName, 'succeeded', succeeded.toString(), 'false');
            expect(succeeded).assertFalse();
            logPair(caseName, 'status', model.getStatus().toString(), HomeStatus.PUBLISH_FAILED.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.PUBLISH_FAILED);
            logPair(caseName, 'operating', model.isOperating().toString(), 'false');
            expect(model.isOperating()).assertFalse();
            logPair(caseName, 'publisher.calls', publisher.getCalls().toString(), '1');
            expect(publisher.getCalls()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0004
         * @tc.name      testHomeModelFlow0004
         * @tc.desc      发布进行中的第二次发布被忽略，第一次发布仍正常完成
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeModelFlow0004';
            logBegin(caseName);
            const publisher: FakePublisher = new FakePublisher(false);
            const model: HomeStateModel = new HomeStateModel(new EventRecordManager(), publisher);
            const firstPromise: Promise<boolean> = model.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            const secondResult: boolean = await model.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            logPair(caseName, 'secondResult', secondResult.toString(), 'false');
            expect(secondResult).assertFalse();
            const firstResult: boolean = await firstPromise;
            logPair(caseName, 'firstResult', firstResult.toString(), 'true');
            expect(firstResult).assertTrue();
            logPair(caseName, 'publisher.calls', publisher.getCalls().toString(), '1');
            expect(publisher.getCalls()).assertEqual(1);
            logPair(caseName, 'status', model.getStatus().toString(), HomeStatus.PUBLISH_SUCCESS.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.PUBLISH_SUCCESS);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0005
         * @tc.name      testHomeModelFlow0005
         * @tc.desc      接收事件后快照记录数据、来源与序号
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testHomeModelFlow0005';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel();
            model.handleEvent(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            const snapshot: HomeSnapshot = model.snapshot();
            logPair(caseName, 'count', snapshot.count.toString(), '1');
            expect(snapshot.count).assertEqual(1);
            logPair(caseName, 'lastData', snapshot.lastData, CommonEventConstants.DATA_OUT_APP);
            expect(snapshot.lastData).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logPair(caseName, 'lastSource', snapshot.lastSource.toString(), EventSource.PAGE.toString());
            expect(snapshot.lastSource).assertEqual(EventSource.PAGE);
            logPair(caseName, 'status', snapshot.status.toString(), HomeStatus.EVENT_RECEIVED.toString());
            expect(snapshot.status).assertEqual(HomeStatus.EVENT_RECEIVED);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0006
         * @tc.name      testHomeModelFlow0006
         * @tc.desc      容量为 2 时第三条事件使最旧记录被移除
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testHomeModelFlow0006';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel(new EventRecordManager(2));
            model.handleEvent('Data_01', EventSource.FORM);
            model.handleEvent('Data_02', EventSource.PAGE);
            model.handleEvent('Data_03', EventSource.UNKNOWN);
            const snapshot: HomeSnapshot = model.snapshot();
            logPair(caseName, 'count', snapshot.count.toString(), '2');
            expect(snapshot.count).assertEqual(2);
            logPair(caseName, 'firstSequence', snapshot.firstSequence.toString(), '2');
            expect(snapshot.firstSequence).assertEqual(2);
            logPair(caseName, 'lastSequence', snapshot.lastSequence.toString(), '3');
            expect(snapshot.lastSequence).assertEqual(3);
            logPair(caseName, 'lastData', snapshot.lastData, 'Data_03');
            expect(snapshot.lastData).assertEqual('Data_03');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0007
         * @tc.name      testHomeModelFlow0007
         * @tc.desc      清空后状态复位，下一条事件重新从序号 1 开始
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testHomeModelFlow0007';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel();
            model.handleEvent('Data_01', EventSource.FORM);
            model.handleEvent('Data_02', EventSource.FORM);
            model.clear();
            logPair(caseName, 'status after clear', model.getStatus().toString(), HomeStatus.CLEARED.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.CLEARED);
            logPair(caseName, 'count after clear', model.getReceivedCount().toString(), '0');
            expect(model.getReceivedCount()).assertEqual(0);
            model.handleEvent('Data_03', EventSource.FORM);
            const snapshot: HomeSnapshot = model.snapshot();
            logPair(caseName, 'firstSequence', snapshot.firstSequence.toString(), '1');
            expect(snapshot.firstSequence).assertEqual(1);
            logPair(caseName, 'lastSequence', snapshot.lastSequence.toString(), '1');
            expect(snapshot.lastSequence).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0008
         * @tc.name      testHomeModelFlow0008
         * @tc.desc      空数据事件被拒绝且不改变状态与计数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testHomeModelFlow0008';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel();
            const record: EventRecord | null = model.handleEvent(CommonEventConstants.EMPTY_VALUE, EventSource.FORM);
            logPair(caseName, 'record', (record === null).toString(), 'true');
            expect(record === null).assertTrue();
            logPair(caseName, 'count', model.getReceivedCount().toString(), '0');
            expect(model.getReceivedCount()).assertEqual(0);
            logPair(caseName, 'status', model.getStatus().toString(), HomeStatus.READY.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.READY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0009
         * @tc.name      testHomeModelFlow0009
         * @tc.desc      非整数来源码的事件被拒绝且不改变状态
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testHomeModelFlow0009';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel();
            const record: EventRecord | null = model.handleEvent(CommonEventConstants.DATA_IN_APP, 1.5);
            logPair(caseName, 'record', (record === null).toString(), 'true');
            expect(record === null).assertTrue();
            logPair(caseName, 'lastSource', model.getLastSourceCode().toString(),
                HomeStateModel.NO_SOURCE.toString());
            expect(model.getLastSourceCode()).assertEqual(HomeStateModel.NO_SOURCE);
            logPair(caseName, 'status', model.getStatus().toString(), HomeStatus.READY.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.READY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_HMREAL_0010
         * @tc.name      testHomeModelFlow0010
         * @tc.desc      订阅状态与事件状态互不覆盖
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeModelFlow0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testHomeModelFlow0010';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel();
            model.markSubscribed();
            logPair(caseName, 'status after subscribe', model.getStatus().toString(),
                HomeStatus.SUBSCRIBED.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.SUBSCRIBED);
            model.handleEvent(CommonEventConstants.DATA_IN_APP, EventSource.PAGE);
            logPair(caseName, 'status after event', model.getStatus().toString(),
                HomeStatus.EVENT_RECEIVED.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.EVENT_RECEIVED);
            logPair(caseName, 'subscribed', model.isSubscribed().toString(), 'true');
            expect(model.isSubscribed()).assertTrue();
            model.markUnsubscribed();
            logPair(caseName, 'status after unsubscribe', model.getStatus().toString(),
                HomeStatus.UNSUBSCRIBED.toString());
            expect(model.getStatus()).assertEqual(HomeStatus.UNSUBSCRIBED);
            logPair(caseName, 'count kept', model.getReceivedCount().toString(), '1');
            expect(model.getReceivedCount()).assertEqual(1);
            logEnd(caseName);
        })
    })
}