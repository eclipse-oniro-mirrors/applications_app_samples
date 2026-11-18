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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import { runCase, addLog } from '../testkit/SharedDriver';
import { Logger } from '../../../main/ets/utils/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function loggerTest(): void {
    describe('LoggerTest', () => {
        beforeAll(() => {
            addLog('LoggerTest suite started');
        })

        /**
         * @tc.number SUB_LOGGER_0001
         * @tc.name testLogger0001
         * @tc.desc Verify Logger.info does not throw for normal message.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testLogger0001', 0, (done: Function) => {
            runCase('testLogger0001', async () => {
                let noException = true;
                try {
                    Logger.info('Test info message from LoggerTest');
                } catch (e) {
                    noException = false;
                }
                expect(noException).assertTrue();
                let noException2 = true;
                try {
                    Logger.info('Another info call with number-like string: 12345');
                } catch (e) {
                    noException2 = false;
                }
                expect(noException2).assertTrue();
                let noException3 = true;
                try {
                    Logger.info('Special chars: !@#$%^&*()');
                } catch (e) {
                    noException3 = false;
                }
                expect(noException3).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_LOGGER_0002
         * @tc.name testLogger0002
         * @tc.desc Verify Logger.error does not throw for normal message.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testLogger0002', 0, (done: Function) => {
            runCase('testLogger0002', async () => {
                let noException = true;
                try {
                    Logger.error('Test error message from LoggerTest');
                } catch (e) {
                    noException = false;
                }
                expect(noException).assertTrue();
                let noException2 = true;
                try {
                    Logger.error('Error with unicode escape: \u0041\u0042');
                } catch (e) {
                    noException2 = false;
                }
                expect(noException2).assertTrue();
                let noException3 = true;
                try {
                    Logger.error('Repeated error message for stress test');
                    Logger.error('Repeated error message for stress test');
                } catch (e) {
                    noException3 = false;
                }
                expect(noException3).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_LOGGER_0003
         * @tc.name testLogger0003
         * @tc.desc Verify Logger handles empty string input without throwing.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testLogger0003', 0, (done: Function) => {
            runCase('testLogger0003', async () => {
                let noException = true;
                try {
                    Logger.info('');
                    Logger.error('');
                } catch (e) {
                    noException = false;
                }
                expect(noException).assertTrue();
                let noException2 = true;
                try {
                    Logger.warn('');
                } catch (e) {
                    noException2 = false;
                }
                expect(noException2).assertTrue();
                let noException3 = true;
                try {
                    Logger.info('   ');
                    Logger.error('   ');
                    Logger.warn('   ');
                } catch (e) {
                    noException3 = false;
                }
                expect(noException3).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_LOGGER_0004
         * @tc.name testLogger0004
         * @tc.desc Verify Logger.warn does not throw for normal message.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testLogger0004', 0, (done: Function) => {
            runCase('testLogger0004', async () => {
                let noException = true;
                try {
                    Logger.warn('Test warn message from LoggerTest');
                } catch (e) {
                    noException = false;
                }
                expect(noException).assertTrue();
                let noException2 = true;
                try {
                    Logger.warn('Warn with long text: ' + 'x'.repeat(200));
                } catch (e) {
                    noException2 = false;
                }
                expect(noException2).assertTrue();
                let noException3 = true;
                try {
                    Logger.warn('All three methods in sequence');
                    Logger.info('Info after warn');
                    Logger.error('Error after info');
                } catch (e) {
                    noException3 = false;
                }
                expect(noException3).assertTrue();
            }, done);
        })
    })
}
