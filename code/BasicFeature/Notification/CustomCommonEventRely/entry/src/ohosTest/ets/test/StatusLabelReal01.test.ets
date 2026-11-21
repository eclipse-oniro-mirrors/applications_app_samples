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
import { CommonEventConstants, EventSource, SourceLabel, StatusLabel } from '../../../main/ets/util/Constants';
import { EventRecord, EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { HomeStateModel, HomeStatus } from '../../../main/ets/feature/HomeStateModel';
import { FakePublisher } from './util/ModelSupport';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

/**
 * Verifies the status label keys against the real home state model flows.
 */
export default function statusLabelReal01Test() {
    describe('StatusLabelReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_STKEYREAL_0001
         * @tc.name      testStatusLabelReal0001
         * @tc.desc      模型驱动的九个状态键按生命周期巡回且互不串台
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testStatusLabelReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testStatusLabelReal0001';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel(new EventRecordManager(10), new FakePublisher(false));
            logPair(caseName, 'ready key', StatusLabel.of(model.getStatus()), StatusLabel.READY_KEY);
            expect(StatusLabel.of(model.getStatus())).assertEqual(StatusLabel.READY_KEY);
            model.markSubscribed();
            logPair(caseName, 'subscribed key', StatusLabel.of(model.getStatus()), StatusLabel.SUBSCRIBED_KEY);
            expect(StatusLabel.of(model.getStatus())).assertEqual(StatusLabel.SUBSCRIBED_KEY);
            model.markSubscribeFailed();
            logPair(caseName, 'failed key', StatusLabel.of(model.getStatus()), StatusLabel.SUBSCRIBE_FAILED_KEY);
            expect(StatusLabel.of(model.getStatus())).assertEqual(StatusLabel.SUBSCRIBE_FAILED_KEY);
            model.markUnsubscribed();
            logPair(caseName, 'unsubscribed key', StatusLabel.of(model.getStatus()), StatusLabel.UNSUBSCRIBED_KEY);
            expect(StatusLabel.of(model.getStatus())).assertEqual(StatusLabel.UNSUBSCRIBED_KEY);
            const published: boolean =
                await model.publish(CommonEventConstants.DATA_IN_APP, EventSource.PAGE);
            logPair(caseName, 'published', published.toString(), 'true');
            expect(published).assertTrue();
            logPair(caseName, 'success key', StatusLabel.of(model.getStatus()), StatusLabel.PUBLISH_SUCCESS_KEY);
            expect(StatusLabel.of(model.getStatus())).assertEqual(StatusLabel.PUBLISH_SUCCESS_KEY);
            const received: EventRecord | null =
                model.handleEvent(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            logPair(caseName, 'received record', received === null ? 'null' : received.data,
                CommonEventConstants.DATA_IN_APP);
            expect(received === null).assertFalse();
            logPair(caseName, 'received key', StatusLabel.of(model.getStatus()), StatusLabel.EVENT_RECEIVED_KEY);
            expect(StatusLabel.of(model.getStatus())).assertEqual(StatusLabel.EVENT_RECEIVED_KEY);
            model.clear();
            logPair(caseName, 'cleared key', StatusLabel.of(model.getStatus()), StatusLabel.CLEARED_KEY);
            expect(StatusLabel.of(model.getStatus())).assertEqual(StatusLabel.CLEARED_KEY);
            const failing: HomeStateModel = new HomeStateModel(new EventRecordManager(5), new FakePublisher(true));
            const failed: boolean =
                await failing.publish(CommonEventConstants.DATA_IN_APP, EventSource.PAGE);
            logPair(caseName, 'failed publish', failed.toString(), 'false');
            expect(failed).assertFalse();
            logPair(caseName, 'publish failed key', StatusLabel.of(failing.getStatus()),
                StatusLabel.PUBLISH_FAILED_KEY);
            expect(StatusLabel.of(failing.getStatus())).assertEqual(StatusLabel.PUBLISH_FAILED_KEY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STKEYREAL_0002
         * @tc.name      testStatusLabelReal0002
         * @tc.desc      HomeStatus 枚举与状态键镜像常量逐一对照一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testStatusLabelReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testStatusLabelReal0002';
            logBegin(caseName);
            const pairs: number[][] = [
                [HomeStatus.READY, 0],
                [HomeStatus.SUBSCRIBED, StatusLabel.STATUS_SUBSCRIBED],
                [HomeStatus.SUBSCRIBE_FAILED, StatusLabel.STATUS_SUBSCRIBE_FAILED],
                [HomeStatus.UNSUBSCRIBED, StatusLabel.STATUS_UNSUBSCRIBED],
                [HomeStatus.PUBLISHING, StatusLabel.STATUS_PUBLISHING],
                [HomeStatus.PUBLISH_SUCCESS, StatusLabel.STATUS_PUBLISH_SUCCESS],
                [HomeStatus.PUBLISH_FAILED, StatusLabel.STATUS_PUBLISH_FAILED],
                [HomeStatus.EVENT_RECEIVED, StatusLabel.STATUS_EVENT_RECEIVED],
                [HomeStatus.CLEARED, StatusLabel.STATUS_CLEARED]
            ];
            logPair(caseName, 'mirror pairs', pairs.length.toString(), '9');
            expect(pairs.length).assertEqual(9);
            for (const pair of pairs) {
                logPair(caseName, 'mirror value', String(pair[0]), String(pair[1]));
                expect(pair[0]).assertEqual(pair[1]);
            }
            logPair(caseName, 'ready key', StatusLabel.of(HomeStatus.READY), StatusLabel.READY_KEY);
            expect(StatusLabel.of(HomeStatus.READY)).assertEqual(StatusLabel.READY_KEY);
            logPair(caseName, 'cleared key', StatusLabel.of(HomeStatus.CLEARED), StatusLabel.CLEARED_KEY);
            expect(StatusLabel.of(HomeStatus.CLEARED)).assertEqual(StatusLabel.CLEARED_KEY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STKEYREAL_0003
         * @tc.name      testStatusLabelReal0003
         * @tc.desc      未知与非法状态值均回退就绪键且不抛异常
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testStatusLabelReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testStatusLabelReal0003';
            logBegin(caseName);
            const unknowns: number[] = [-1, 9, 100, -100, 1.5, Number.NaN, Number.POSITIVE_INFINITY];
            logPair(caseName, 'unknown count', unknowns.length.toString(), '7');
            expect(unknowns.length).assertEqual(7);
            for (const status of unknowns) {
                logPair(caseName, 'fallback', StatusLabel.of(status), StatusLabel.READY_KEY);
                expect(StatusLabel.of(status)).assertEqual(StatusLabel.READY_KEY);
            }
            logPair(caseName, 'nan fallback', StatusLabel.of(Number.NaN), StatusLabel.READY_KEY);
            expect(StatusLabel.of(Number.NaN)).assertEqual(StatusLabel.READY_KEY);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STKEYREAL_0004
         * @tc.name      testStatusLabelReal0004
         * @tc.desc      状态键族与来源键族前缀互不相同且互不包含
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testStatusLabelReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testStatusLabelReal0004';
            logBegin(caseName);
            logPair(caseName, 'status prefix', StatusLabel.PREFIX, 'status_');
            expect(StatusLabel.PREFIX).assertEqual('status_');
            logPair(caseName, 'source prefix', SourceLabel.PREFIX, 'source_');
            expect(SourceLabel.PREFIX).assertEqual('source_');
            logPair(caseName, 'distinct prefixes', String(StatusLabel.PREFIX === SourceLabel.PREFIX), 'false');
            expect(StatusLabel.PREFIX === SourceLabel.PREFIX).assertFalse();
            logPair(caseName, 'status key holds no source prefix',
                String(StatusLabel.of(EventSource.PAGE).indexOf(SourceLabel.PREFIX)), '-1');
            expect(StatusLabel.of(EventSource.PAGE).indexOf(SourceLabel.PREFIX)).assertEqual(-1);
            logPair(caseName, 'source key holds no status prefix',
                String(SourceLabel.of(EventSource.PAGE).indexOf(StatusLabel.PREFIX)), '-1');
            expect(SourceLabel.of(EventSource.PAGE).indexOf(StatusLabel.PREFIX)).assertEqual(-1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STKEYREAL_0005
         * @tc.name      testStatusLabelReal0005
         * @tc.desc      九个状态键均为前缀加小写下划线词的资源键形态
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testStatusLabelReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testStatusLabelReal0005';
            logBegin(caseName);
            const keys: string[] = [
                StatusLabel.READY_KEY, StatusLabel.SUBSCRIBED_KEY, StatusLabel.SUBSCRIBE_FAILED_KEY,
                StatusLabel.UNSUBSCRIBED_KEY, StatusLabel.PUBLISHING_KEY, StatusLabel.PUBLISH_SUCCESS_KEY,
                StatusLabel.PUBLISH_FAILED_KEY, StatusLabel.EVENT_RECEIVED_KEY, StatusLabel.CLEARED_KEY
            ];
            logPair(caseName, 'key count', keys.length.toString(), '9');
            expect(keys.length).assertEqual(9);
            for (const key of keys) {
                logPair(caseName, 'resource shape', key, StatusLabel.PREFIX + key.slice(StatusLabel.PREFIX.length));
                expect(key.indexOf(' ')).assertEqual(-1);
                expect(key === key.toLowerCase()).assertTrue();
                expect(key.startsWith(StatusLabel.PREFIX)).assertTrue();
            }
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STKEYREAL_0006
         * @tc.name      testStatusLabelReal0006
         * @tc.desc      状态键两两互异且同一状态的重复查询结果幂等
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testStatusLabelReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testStatusLabelReal0006';
            logBegin(caseName);
            const keys: string[] = [
                StatusLabel.of(0), StatusLabel.of(1), StatusLabel.of(2), StatusLabel.of(3),
                StatusLabel.of(4), StatusLabel.of(5), StatusLabel.of(6), StatusLabel.of(7), StatusLabel.of(8)
            ];
            const distinct: Set<string> = new Set<string>(keys);
            logPair(caseName, 'distinct keys', distinct.size.toString(), '9');
            expect(distinct.size).assertEqual(9);
            logPair(caseName, 'repeatable query', String(StatusLabel.of(4) === StatusLabel.of(4)), 'true');
            expect(StatusLabel.of(4) === StatusLabel.of(4)).assertTrue();
            logPair(caseName, 'unknown and ready equal', String(StatusLabel.of(0) === StatusLabel.of(-1)), 'true');
            expect(StatusLabel.of(0) === StatusLabel.of(-1)).assertTrue();
            logEnd(caseName);
        })
    })
}
