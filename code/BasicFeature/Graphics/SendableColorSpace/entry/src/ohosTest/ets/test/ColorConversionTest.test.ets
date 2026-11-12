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

import { describe, it, expect } from '@ohos/hypium';
import {
    runCase,
    addLog,
    isCloseTo,
    numberAfter,
    resetToIndex,
    navigateToConversion,
    clickId,
    textOfId,
    existsId,
    waitId
} from '../testkit/SharedDriver';

const INDEX_TITLE_ID = 'TitleText';
const CONV_PAGE_TITLE_ID = 'ConvPageTitle';

// The page reports a byte triple such as Encoded:(233, 54, 40), and the key selects which block is read.
function channelAfter(text: string, key: string, offset: number): number {
    const at: number = text.indexOf(key);
    if (at < 0) {
        return Number.NaN;
    }
    let body: string = text.substring(at + key.length);
    const close: number = body.indexOf(')');
    if (close < 0) {
        return Number.NaN;
    }
    body = body.substring(0, close);
    const parts: string[] = [];
    let start: number = 0;
    for (let i = 0; i < body.length; i++) {
        if (body.charAt(i) === ',') {
            parts.push(body.substring(start, i));
            start = i + 1;
        }
    }
    parts.push(body.substring(start));
    if (offset < 0 || offset >= parts.length) {
        return Number.NaN;
    }
    return parseFloat(parts[offset]);
}

export default function colorConversionTest(): void {
    describe('ColorConversionTest', () => {

        /*
         * @tc.number: SUB_CS_CONV_0001
         * @tc.name: testConvNavigate0001
         * @tc.desc: Verify the conversion page opens with sRGB red targeting Display P3.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvNavigate0001', 0, async (done: Function) => {
            await runCase('testConvNavigate0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                const title: string = await textOfId(CONV_PAGE_TITLE_ID);
                await addLog(`testConvNavigate0001: actual title=${title}, expected=Color Space Conversion`);
                expect(title).assertEqual('Color Space Conversion');
                const source: string = await textOfId('ConvSrcText');
                await addLog(`testConvNavigate0001: actual source=${source}, expected=Source:SRGB`);
                expect(source).assertEqual('Source:SRGB');
                const destination: string = await textOfId('ConvDstText');
                await addLog(`testConvNavigate0001: actual destination=${destination}, ` +
                  `expected=Destination:Display_P3`);
                expect(destination).assertEqual('Destination:Display_P3');
                const input: string = await textOfId('ConvInputText');
                await addLog(`testConvNavigate0001: actual input=${input}, expected=Input:#ff0000`);
                expect(input).assertEqual('Input:#ff0000');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0002
         * @tc.name: testConvIdentity0001
         * @tc.desc: Verify converting a color onto its own space leaves the byte triple untouched.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvIdentity0001', 0, async (done: Function) => {
            await runCase('testConvIdentity0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvDst_SRGB');
                const destination: string = await textOfId('ConvDstText');
                await addLog(`testConvIdentity0001: actual destination=${destination}, expected=Destination:SRGB`);
                expect(destination).assertEqual('Destination:SRGB');
                const encoded: string = await textOfId('ConvOutText');
                await addLog(`testConvIdentity0001: actual encoded=${encoded}, expected=Encoded:(255, 0, 0)`);
                expect(encoded).assertEqual('Encoded:(255, 0, 0)');
                const status: string = await textOfId('ConvStatusText');
                await addLog(`testConvIdentity0001: actual status=${status}, expected=Status:InGamut`);
                expect(status).assertEqual('Status:InGamut');
                const clipped: string = await textOfId('ConvClipText');
                await addLog(`testConvIdentity0001: actual clipped=${clipped}, expected=Clipped:(255, 0, 0)`);
                expect(clipped).assertEqual('Clipped:(255, 0, 0)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0003
         * @tc.name: testConvXyz0001
         * @tc.desc: Verify sRGB red is reported with the published XYZ triple.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvXyz0001', 0, async (done: Function) => {
            await runCase('testConvXyz0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                const xyz: string = await textOfId('ConvXyzText');
                await addLog(`testConvXyz0001: actual XYZ line=${xyz}, expected X=0.4124 Y=0.2126 Z=0.0193`);
                expect(isCloseTo(numberAfter(xyz, 'X='), 0.4124, 0.001)).assertTrue();
                await addLog(`testConvXyz0001: actual Y=${numberAfter(xyz, 'Y=')}, expected=0.2126`);
                expect(isCloseTo(numberAfter(xyz, 'Y='), 0.2126, 0.001)).assertTrue();
                await addLog(`testConvXyz0001: actual Z=${numberAfter(xyz, 'Z=')}, expected=0.0193`);
                expect(isCloseTo(numberAfter(xyz, 'Z='), 0.0193, 0.001)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0004
         * @tc.name: testConvLab0001
         * @tc.desc: Verify sRGB red is reported with the published Lab triple.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvLab0001', 0, async (done: Function) => {
            await runCase('testConvLab0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                const lab: string = await textOfId('ConvLabText');
                await addLog(`testConvLab0001: actual lightness=${numberAfter(lab, 'L=')}, expected=53.24`);
                expect(isCloseTo(numberAfter(lab, 'L='), 53.24, 0.6)).assertTrue();
                await addLog(`testConvLab0001: actual a channel=${numberAfter(lab, 'a=')}, expected=80.09`);
                expect(isCloseTo(numberAfter(lab, 'a='), 80.09, 0.8)).assertTrue();
                await addLog(`testConvLab0001: actual b channel=${numberAfter(lab, 'b=')}, expected=67.20`);
                expect(isCloseTo(numberAfter(lab, 'b='), 67.20, 0.8)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0005
         * @tc.name: testConvWhite0001
         * @tc.desc: Verify white is preserved when both spaces share the D65 white point.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvWhite0001', 0, async (done: Function) => {
            await runCase('testConvWhite0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvColor3');
                const input: string = await textOfId('ConvInputText');
                await addLog(`testConvWhite0001: actual input=${input}, expected=Input:#ffffff`);
                expect(input).assertEqual('Input:#ffffff');
                const encoded: string = await textOfId('ConvOutText');
                await addLog(`testConvWhite0001: actual encoded=${encoded}, expected=Encoded:(255, 255, 255)`);
                expect(encoded).assertEqual('Encoded:(255, 255, 255)');
                const status: string = await textOfId('ConvStatusText');
                await addLog(`testConvWhite0001: actual status=${status}, expected=Status:InGamut`);
                expect(status).assertEqual('Status:InGamut');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0006
         * @tc.name: testConvGray0001
         * @tc.desc: Verify a neutral gray keeps its level when it crosses into Display P3.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvGray0001', 0, async (done: Function) => {
            await runCase('testConvGray0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvColor4');
                const input: string = await textOfId('ConvInputText');
                await addLog(`testConvGray0001: actual input=${input}, expected=Input:#808080`);
                expect(input).assertEqual('Input:#808080');
                const encoded: string = await textOfId('ConvOutText');
                const red: number = channelAfter(encoded, 'Encoded:(', 0);
                const green: number = channelAfter(encoded, 'Encoded:(', 1);
                const blue: number = channelAfter(encoded, 'Encoded:(', 2);
                await addLog(`testConvGray0001: actual red=${red}, expected within 1 of 128`);
                expect(Math.abs(red - 128) <= 1).assertTrue();
                await addLog(`testConvGray0001: actual green=${green}, expected within 1 of 128`);
                expect(Math.abs(green - 128) <= 1).assertTrue();
                await addLog(`testConvGray0001: actual blue=${blue}, expected within 1 of 128`);
                expect(Math.abs(blue - 128) <= 1).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0007
         * @tc.name: testConvRedToP30001
         * @tc.desc: Verify sRGB red stays in gamut inside Display P3 but needs a lower code value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvRedToP30001', 0, async (done: Function) => {
            await runCase('testConvRedToP30001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                const status: string = await textOfId('ConvStatusText');
                await addLog(`testConvRedToP30001: actual status=${status}, expected=Status:InGamut`);
                expect(status).assertEqual('Status:InGamut');
                const encoded: string = await textOfId('ConvOutText');
                const red: number = channelAfter(encoded, 'Encoded:(', 0);
                await addLog(`testConvRedToP30001: actual red=${red}, expected within 2 of 233`);
                expect(isCloseTo(red, 233, 2)).assertTrue();
                await addLog(`testConvRedToP30001: actual red=${red}, expected below 255`);
                expect(red < 255).assertTrue();
                const green: number = channelAfter(encoded, 'Encoded:(', 1);
                await addLog(`testConvRedToP30001: actual green=${green}, expected within 2 of 54`);
                expect(isCloseTo(green, 54, 2)).assertTrue();
                const clipped: string = await textOfId('ConvClipText');
                await addLog(`testConvRedToP30001: actual clipped=${clipped}, expected=Clipped:(233, 54, 40)`);
                expect(clipped).assertEqual('Clipped:(233, 54, 40)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0008
         * @tc.name: testConvRedToBT20200001
         * @tc.desc: Verify sRGB red needs an even lower code value inside the wider BT.2020 triangle.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvRedToBT20200001', 0, async (done: Function) => {
            await runCase('testConvRedToBT20200001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvDst_BT2020_HLG');
                const destination: string = await textOfId('ConvDstText');
                await addLog(`testConvRedToBT20200001: actual destination=${destination}, ` +
                    'expected=Destination:BT2020_HLG');
                expect(destination).assertEqual('Destination:BT2020_HLG');
                const status: string = await textOfId('ConvStatusText');
                await addLog(`testConvRedToBT20200001: actual status=${status}, expected=Status:InGamut`);
                expect(status).assertEqual('Status:InGamut');
                const encoded: string = await textOfId('ConvOutText');
                const red: number = channelAfter(encoded, 'Encoded:(', 0);
                await addLog(`testConvRedToBT20200001: actual red=${red}, expected within 2 of 206`);
                expect(isCloseTo(red, 206, 2)).assertTrue();
                const green: number = channelAfter(encoded, 'Encoded:(', 1);
                await addLog(`testConvRedToBT20200001: actual green=${green}, expected within 2 of 76`);
                expect(isCloseTo(green, 76, 2)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0009
         * @tc.name: testConvOutOfGamut0001
         * @tc.desc: Verify a BT.2020 red leaves the sRGB gamut and is clamped for display.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvOutOfGamut0001', 0, async (done: Function) => {
            await runCase('testConvOutOfGamut0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvSrc_BT2020_HLG');
                await clickId('ConvDst_SRGB');
                const status: string = await textOfId('ConvStatusText');
                await addLog(`testConvOutOfGamut0001: actual status=${status}, expected=Status:OutOfGamut`);
                expect(status).assertEqual('Status:OutOfGamut');
                const encoded: string = await textOfId('ConvOutText');
                const red: number = channelAfter(encoded, 'Encoded:(', 0);
                await addLog(`testConvOutOfGamut0001: actual red=${red}, expected within 3 of 321`);
                expect(isCloseTo(red, 321, 3)).assertTrue();
                await addLog(`testConvOutOfGamut0001: actual red=${red}, expected above 255`);
                expect(red > 255).assertTrue();
                const green: number = channelAfter(encoded, 'Encoded:(', 1);
                await addLog(`testConvOutOfGamut0001: actual green=${green}, expected below 0`);
                expect(green < 0).assertTrue();
                const clipped: string = await textOfId('ConvClipText');
                await addLog(`testConvOutOfGamut0001: actual clipped=${clipped}, expected=Clipped:(255, 0, 0)`);
                expect(clipped).assertEqual('Clipped:(255, 0, 0)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0010
         * @tc.name: testConvClipGreen0001
         * @tc.desc: Verify a BT.2020 green overflows the sRGB green channel and drives red and blue below zero.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testConvClipGreen0001', 0, async (done: Function) => {
            await runCase('testConvClipGreen0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvSrc_BT2020_HLG');
                await clickId('ConvDst_SRGB');
                await clickId('ConvColor1');
                const status: string = await textOfId('ConvStatusText');
                await addLog(`testConvClipGreen0001: actual status=${status}, expected=Status:OutOfGamut`);
                expect(status).assertEqual('Status:OutOfGamut');
                const clipped: string = await textOfId('ConvClipText');
                await addLog(`testConvClipGreen0001: actual clipped=${clipped}, expected=Clipped:(0, 255, 0)`);
                expect(clipped).assertEqual('Clipped:(0, 255, 0)');
                const encoded: string = await textOfId('ConvOutText');
                const green: number = channelAfter(encoded, 'Encoded:(', 1);
                await addLog(`testConvClipGreen0001: actual green=${green}, expected within 3 of 270`);
                expect(isCloseTo(green, 270, 3)).assertTrue();
                await addLog(`testConvClipGreen0001: actual green=${green}, expected above 255`);
                expect(green > 255).assertTrue();
                const red: number = channelAfter(encoded, 'Encoded:(', 0);
                await addLog(`testConvClipGreen0001: actual red=${red}, expected below 0`);
                expect(red < 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0011
         * @tc.name: testConvSwap0001
         * @tc.desc: Verify swapping the spaces exchanges the source and destination and inverts the direction.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvSwap0001', 0, async (done: Function) => {
            await runCase('testConvSwap0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                const before: string = await textOfId('ConvOutText');
                await clickId('ConvBtnSwapSpaces');
                const source: string = await textOfId('ConvSrcText');
                await addLog(`testConvSwap0001: actual source=${source}, expected=Source:Display_P3`);
                expect(source).assertEqual('Source:Display_P3');
                const destination: string = await textOfId('ConvDstText');
                await addLog(`testConvSwap0001: actual destination=${destination}, expected=Destination:SRGB`);
                expect(destination).assertEqual('Destination:SRGB');
                const after: string = await textOfId('ConvOutText');
                await addLog(`testConvSwap0001: before=${before} after=${after}, expected different`);
                expect(after === before).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0012
         * @tc.name: testConvColorPreset0001
         * @tc.desc: Verify the orange preset reports the expected hex and byte triple in sRGB.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvColorPreset0001', 0, async (done: Function) => {
            await runCase('testConvColorPreset0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvDst_SRGB');
                await clickId('ConvColor5');
                const input: string = await textOfId('ConvInputText');
                await addLog(`testConvColorPreset0001: actual input=${input}, expected=Input:#ff8000`);
                expect(input).assertEqual('Input:#ff8000');
                const encoded: string = await textOfId('ConvOutText');
                await addLog(`testConvColorPreset0001: actual encoded=${encoded}, expected=Encoded:(255, 128, 0)`);
                expect(encoded).assertEqual('Encoded:(255, 128, 0)');
                const status: string = await textOfId('ConvStatusText');
                await addLog(`testConvColorPreset0001: actual status=${status}, expected=Status:InGamut`);
                expect(status).assertEqual('Status:InGamut');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0013
         * @tc.name: testConvReset0001
         * @tc.desc: Verify reset restores both spaces and the default red color.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testConvReset0001', 0, async (done: Function) => {
            await runCase('testConvReset0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvSrc_Adobe_RGB_1998');
                await clickId('ConvDst_BT709');
                await clickId('ConvColor4');
                await clickId('ConvBtnReset');
                const source: string = await textOfId('ConvSrcText');
                await addLog(`testConvReset0001: actual source=${source}, expected=Source:SRGB`);
                expect(source).assertEqual('Source:SRGB');
                const destination: string = await textOfId('ConvDstText');
                await addLog(`testConvReset0001: actual destination=${destination}, expected=Destination:Display_P3`);
                expect(destination).assertEqual('Destination:Display_P3');
                const input: string = await textOfId('ConvInputText');
                await addLog(`testConvReset0001: actual input=${input}, expected=Input:#ff0000`);
                expect(input).assertEqual('Input:#ff0000');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CONV_0014
         * @tc.name: testConvBack0001
         * @tc.desc: Verify the conversion page back button returns to the index.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testConvBack0001', 0, async (done: Function) => {
            await runCase('testConvBack0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToConversion();
                await clickId('ConvBtnBack');
                await waitId(INDEX_TITLE_ID);
                await addLog('testConvBack0001: actual index visible=true, expected=true');
                expect(await existsId(INDEX_TITLE_ID)).assertTrue();
                await addLog('testConvBack0001: actual page title gone=true, expected=true');
                expect(await existsId(CONV_PAGE_TITLE_ID)).assertFalse();
                await addLog('testConvBack0001: actual index button visible=true, expected=true');
                expect(await existsId('NavConversion')).assertTrue();
            }, done);
        });
    });
}
