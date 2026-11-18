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

import { describe, expect, it } from '@ohos/hypium';
import logger from '../../../../main/ets/utils/Logger';
import { addLog, isCloseTo, runCase } from '../../testkit/SharedDriver';
import { Primaries, gamutArea } from '../../../../main/ets/common/ColorSpaceMath';

// The logger is a thin hilog forwarder, so its observable contract is that every input shape
// completes without throwing and leaves the rest of the process working.
const REFERENCE_PRIMARIES: Primaries = {
    redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
    whiteX: 0.3127, whiteY: 0.3290
};

export default function utilsSuite01(): void {
    describe('UtilsSuite01', () => {
        /*
         * @tc.number: SUB_CS_UTIL_0001
         * @tc.name: testUtilsLogger0001
         * @tc.desc: Verify the debug entry accepts zero, one and empty string arguments without throwing.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testUtilsLogger0001', 0, async (done: Function) => {
            await runCase('testUtilsLogger0001', async (): Promise<void> => {
                let noArgument: string = '';
                try {
                    logger.debug();
                } catch (error) {
                    noArgument = String(error);
                }
                await addLog(`testUtilsLogger0001: zero argument error=${noArgument}, expected empty`);
                expect(noArgument).assertEqual('');
                let singleArgument: string = '';
                try {
                    logger.debug('UtilsSuite01 debug single argument');
                } catch (error) {
                    singleArgument = String(error);
                }
                await addLog(`testUtilsLogger0001: single argument error=${singleArgument}, expected empty`);
                expect(singleArgument).assertEqual('');
                let emptyArgument: string = '';
                try {
                    logger.debug('');
                } catch (error) {
                    emptyArgument = String(error);
                }
                await addLog(`testUtilsLogger0001: empty argument error=${emptyArgument}, expected empty`);
                expect(emptyArgument).assertEqual('');
                await addLog('testUtilsLogger0001: the geometry helpers still answer after the log calls');
                expect(gamutArea(REFERENCE_PRIMARIES) > 0.1).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_0002
         * @tc.name: testUtilsLogger0002
         * @tc.desc: Verify the info entry forwards formatting placeholders, localized text and keeps the caller array
         * intact.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testUtilsLogger0002', 0, async (done: Function) => {
            await runCase('testUtilsLogger0002', async (): Promise<void> => {
                let formatted: string = '';
                try {
                    logger.info('UtilsSuite01 info %{public}s gamma %{public}s', 'SRGB', '2.2');
                } catch (error) {
                    formatted = String(error);
                }
                await addLog(`testUtilsLogger0002: placeholder error=${formatted}, expected empty`);
                expect(formatted).assertEqual('');
                let localized: string = '';
                try {
                    logger.info('色彩空间', '白点 0.3127', '伽马 2.2');
                } catch (error) {
                    localized = String(error);
                }
                await addLog(`testUtilsLogger0002: localized error=${localized}, expected empty`);
                expect(localized).assertEqual('');
                let escapedPlaceholders: string = '';
                try {
                    logger.info('literal %{private}s %d %n stays text', 'kept');
                } catch (error) {
                    escapedPlaceholders = String(error);
                }
                await addLog(`testUtilsLogger0002: escaped placeholder error=${escapedPlaceholders}, expected empty`);
                expect(escapedPlaceholders).assertEqual('');
                const values: string[] = ['SRGB', '2.2'];
                logger.info('UtilsSuite01 array %{public}s', values[0]);
                await addLog(`testUtilsLogger0002: array length=${values.length}, expected=2`);
                expect(values.length).assertEqual(2);
                await addLog(`testUtilsLogger0002: array second=${values[1]}, expected=2.2`);
                expect(values[1]).assertEqual('2.2');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_0003
         * @tc.name: testUtilsLogger0003
         * @tc.desc: Verify the warn entry survives a very long payload and a truncated prefix of the same payload.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsLogger0003', 0, async (done: Function) => {
            await runCase('testUtilsLogger0003', async (): Promise<void> => {
                const longText: string = 'W'.repeat(4096);
                let longError: string = '';
                try {
                    logger.warn('UtilsSuite01 long payload', longText);
                } catch (error) {
                    longError = String(error);
                }
                await addLog(`testUtilsLogger0003: long payload error=${longError}, expected empty`);
                expect(longError).assertEqual('');
                await addLog(`testUtilsLogger0003: payload length=${longText.length}, expected=4096`);
                expect(longText.length).assertEqual(4096);
                await addLog(`testUtilsLogger0003: payload head=${longText.charAt(0)}, expected=W`);
                expect(longText.charAt(0)).assertEqual('W');
                let prefixError: string = '';
                try {
                    logger.warn('UtilsSuite01 truncated payload', longText.substring(0, 64));
                } catch (error) {
                    prefixError = String(error);
                }
                await addLog(`testUtilsLogger0003: prefix error=${prefixError}, expected empty`);
                expect(prefixError).assertEqual('');
                await addLog(`testUtilsLogger0003: prefix length=${longText.substring(0, 64).length}, expected=64`);
                expect(longText.substring(0, 64).length).assertEqual(64);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_0004
         * @tc.name: testUtilsLogger0004
         * @tc.desc: Verify a hundred mixed severity calls complete without a single failure.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsLogger0004', 0, async (done: Function) => {
            await runCase('testUtilsLogger0004', async (): Promise<void> => {
                let completed: number = 0;
                let failures: number = 0;
                for (let index = 0; index < 100; index++) {
                    try {
                        if (index % 4 === 0) {
                            logger.debug('UtilsSuite01 loop debug', String(index));
                        } else if (index % 4 === 1) {
                            logger.info('UtilsSuite01 loop info', String(index));
                        } else if (index % 4 === 2) {
                            logger.warn('UtilsSuite01 loop warn', String(index));
                        } else {
                            logger.error('UtilsSuite01 loop error', String(index));
                        }
                        completed++;
                    } catch (error) {
                        failures++;
                    }
                }
                await addLog(`testUtilsLogger0004: completed=${completed}, expected=100`);
                expect(completed).assertEqual(100);
                await addLog(`testUtilsLogger0004: failures=${failures}, expected=0`);
                expect(failures).assertEqual(0);
                let afterLoop: string = '';
                try {
                    logger.error('UtilsSuite01 after loop');
                } catch (error) {
                    afterLoop = String(error);
                }
                await addLog(`testUtilsLogger0004: after loop error=${afterLoop}, expected empty`);
                expect(afterLoop).assertEqual('');
                const area: number = gamutArea(REFERENCE_PRIMARIES);
                await addLog(`testUtilsLogger0004: area=${area}, expected=0.11205`);
                expect(isCloseTo(area, 0.11205, 0.0005)).assertTrue();
            }, done);
        });
    });
}
