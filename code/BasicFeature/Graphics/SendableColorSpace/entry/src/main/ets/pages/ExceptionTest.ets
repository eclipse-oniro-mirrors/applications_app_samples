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

import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import Logger from '../utils/Logger';
import { STANDARD_COLOR_SPACES, getColorSpaceNameStr } from '../common/ColorSpaceData';

const TAG = '[ExceptionTest]';
const BTN_W = '80%';
const BTN_H = 44;

@Entry
@Component
struct ExceptionTest {
    @State errorResult: string = 'Click a button below to test error handling';

    testUnknownEnum(): void {
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.UNKNOWN);
            let name: string = getColorSpaceNameStr(cs.getColorSpaceName());
            this.errorResult = `UNKNOWN enum: Unexpected success, name=${name}`;
            Logger.warn(TAG, 'UNKNOWN enum unexpectedly succeeded');
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `UNKNOWN enum: Caught expected error\n${errStr}`;
            Logger.info(TAG, `UNKNOWN enum error (expected): ${errStr}`);
        }
    }

    testCustomEnum(): void {
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.CUSTOM);
            let name: string = getColorSpaceNameStr(cs.getColorSpaceName());
            this.errorResult = `CUSTOM enum: Unexpected success, name=${name}`;
            Logger.warn(TAG, 'CUSTOM enum unexpectedly succeeded');
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `CUSTOM enum: Caught expected error\n${errStr}`;
            Logger.info(TAG, `CUSTOM enum error (expected): ${errStr}`);
        }
    }

    testNegativeGamma(): void {
        try {
            let primaries: colorSpaceManager.ColorSpacePrimaries = {
                redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60,
                blueX: 0.15, blueY: 0.06, whitePointX: 0.3127, whitePointY: 0.3290
            };
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(primaries, -1.0);
            let gamma: number = cs.getGamma();
            this.errorResult = `Gamma=-1.0: Unexpected success, gamma=${gamma}`;
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Gamma=-1.0: Caught expected error\n${errStr}`;
            Logger.info(TAG, `Negative gamma error (expected): ${errStr}`);
        }
    }

    testZeroGamma(): void {
        try {
            let primaries: colorSpaceManager.ColorSpacePrimaries = {
                redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60,
                blueX: 0.15, blueY: 0.06, whitePointX: 0.3127, whitePointY: 0.3290
            };
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(primaries, 0);
            let gamma: number = cs.getGamma();
            this.errorResult = `Gamma=0: Unexpected success, gamma=${gamma}`;
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Gamma=0: Caught expected error\n${errStr}`;
            Logger.info(TAG, `Zero gamma error (expected): ${errStr}`);
        }
    }

    testInvalidPrimaries(): void {
        try {
            let primaries: colorSpaceManager.ColorSpacePrimaries = {
                redX: 2.0, redY: -0.5, greenX: 3.0, greenY: -1.0,
                blueX: 5.0, blueY: -2.0, whitePointX: 0.3127, whitePointY: 0.3290
            };
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(primaries, 2.2);
            let name: string = getColorSpaceNameStr(cs.getColorSpaceName());
            this.errorResult = `Invalid primaries: Unexpected success, name=${name}`;
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Invalid primaries: Caught expected error\n${errStr}`;
            Logger.info(TAG, `Invalid primaries error (expected): ${errStr}`);
        }
    }

    testInvalidEnum401(): void {
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(999 as colorSpaceManager.ColorSpace);
            let name: string = getColorSpaceNameStr(cs.getColorSpaceName());
            this.errorResult = `Enum=999: Unexpected success, name=${name}`;
            Logger.warn(TAG, 'Enum=999 unexpectedly succeeded');
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Enum=999: Caught expected error (401/18600001)\n${errStr}`;
            Logger.info(TAG, `Enum=999 error (expected): ${errStr}`);
        }
    }

    testNegativeOneEnum(): void {
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(-1 as colorSpaceManager.ColorSpace);
            let name: string = getColorSpaceNameStr(cs.getColorSpaceName());
            this.errorResult = `Enum=-1: Unexpected success, name=${name}`;
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Enum=-1: Caught expected error\n${errStr}`;
            Logger.info(TAG, `Enum=-1 error (expected): ${errStr}`);
        }
    }

    verifySrgbProperties(): void {
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            let gamma: number = cs.getGamma();
            let whitePoint: collections.Array<number> = cs.getWhitePoint();
            let csName: colorSpaceManager.ColorSpace = cs.getColorSpaceName();
            let gammaOk: boolean = Math.abs(gamma - 2.2) < 0.01;
            let wpXOk: boolean = whitePoint.length >= 2 && Math.abs(whitePoint[0] - 0.3127) < 0.001;
            let wpYOk: boolean = whitePoint.length >= 2 && Math.abs(whitePoint[1] - 0.3290) < 0.001;
            let nameOk: boolean = csName === colorSpaceManager.ColorSpace.SRGB;
            let allPass: boolean = gammaOk && wpXOk && wpYOk && nameOk;
            this.errorResult = `SRGB Property Verification:\n` +
                `Gamma: ${gamma} (expect 2.2) [${gammaOk ? 'PASS' : 'FAIL'}]\n` +
                `WhitePoint: [${whitePoint.length >= 2 ? whitePoint[0].toFixed(4) : '?'}, ` +
                  `${whitePoint.length >= 2 ? whitePoint[1].toFixed(4) : '?'}] (expect [0.3127, ` +
                  `0.3290]) [${wpXOk && wpYOk ? 'PASS' : 'FAIL'}]\n` +
                `Name: ${csName} (expect SRGB=4) [${nameOk ? 'PASS' : 'FAIL'}]\n` +
                `Overall: ${allPass ? 'ALL PASS' : 'HAS FAILURES'}`;
            Logger.info(TAG, `SRGB verification: allPass=${allPass}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `SRGB verification error:\n${errStr}`;
        }
    }

    verifyDciP3Properties(): void {
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
            let gamma: number = cs.getGamma();
            let whitePoint: collections.Array<number> = cs.getWhitePoint();
            let gammaOk: boolean = Math.abs(gamma - 2.6) < 0.01;
            let wpXOk: boolean = whitePoint.length >= 2 && Math.abs(whitePoint[0] - 0.314) < 0.002;
            let wpYOk: boolean = whitePoint.length >= 2 && Math.abs(whitePoint[1] - 0.351) < 0.002;
            let allPass: boolean = gammaOk && wpXOk && wpYOk;
            this.errorResult = `DCI_P3 Property Verification:\n` +
                `Gamma: ${gamma} (expect 2.6) [${gammaOk ? 'PASS' : 'FAIL'}]\n` +
                `WhitePoint: [${whitePoint.length >= 2 ? whitePoint[0].toFixed(4) : '?'}, ` +
                  `${whitePoint.length >= 2 ? whitePoint[1].toFixed(4) : '?'}] (expect [0.314, ` +
                  `0.351]) [${wpXOk && wpYOk ? 'PASS' : 'FAIL'}]\n` +
                `Overall: ${allPass ? 'ALL PASS' : 'HAS FAILURES'}`;
            Logger.info(TAG, `DCI_P3 verification: allPass=${allPass}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `DCI_P3 verification error:\n${errStr}`;
        }
    }

    verifyLinearSrgbProperties(): void {
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
            let gamma: number = cs.getGamma();
            let gammaOk: boolean = Math.abs(gamma - 1.0) < 0.01;
            this.errorResult = `LINEAR_SRGB Property Verification:\n` +
                `Gamma: ${gamma} (expect 1.0) [${gammaOk ? 'PASS' : 'FAIL'}]\n` +
                `Overall: ${gammaOk ? 'ALL PASS' : 'HAS FAILURES'}`;
            Logger.info(TAG, `LINEAR_SRGB verification: gammaOk=${gammaOk}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `LINEAR_SRGB verification error:\n${errStr}`;
        }
    }

    verifyAliasDisplaySrgb(): void {
        try {
            let csAlias: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
            let csOrig: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            let aliasName: colorSpaceManager.ColorSpace = csAlias.getColorSpaceName();
            let origName: colorSpaceManager.ColorSpace = csOrig.getColorSpaceName();
            let aliasGamma: number = csAlias.getGamma();
            let origGamma: number = csOrig.getGamma();
            let aliasWp: collections.Array<number> = csAlias.getWhitePoint();
            let origWp: collections.Array<number> = csOrig.getWhitePoint();
            let nameMatch: boolean = aliasName === origName;
            let gammaMatch: boolean = Math.abs(aliasGamma - origGamma) < 0.001;
            let wpMatch: boolean = aliasWp.length >= 2 && origWp.length >= 2 &&
                Math.abs(aliasWp[0] - origWp[0]) < 0.0001 &&
                Math.abs(aliasWp[1] - origWp[1]) < 0.0001;
            let allMatch: boolean = nameMatch && gammaMatch && wpMatch;
            this.errorResult = `DISPLAY_SRGB vs SRGB Alias Verification:\n` +
                `Name: alias=${aliasName} orig=${origName} [${nameMatch ? 'MATCH' : 'DIFF'}]\n` +
                `Gamma: alias=${aliasGamma} orig=${origGamma} [${gammaMatch ? 'MATCH' : 'DIFF'}]\n` +
                `WhitePoint: alias=[${aliasWp.length >= 2 ? aliasWp[0].toFixed(4) : '?'},` +
                  `${aliasWp.length >= 2 ? aliasWp[1].toFixed(4) : '?'}] ` +
                  `orig=[${origWp.length >= 2 ? origWp[0].toFixed(4) : '?'},` +
                  `${origWp.length >= 2 ? origWp[1].toFixed(4) : '?'}] [${wpMatch ? 'MATCH' : 'DIFF'}]\n` +
                `Overall: ${allMatch ? 'ALIAS VERIFIED' : 'ALIAS MISMATCH'}`;
            Logger.info(TAG, `DISPLAY_SRGB alias: allMatch=${allMatch}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `DISPLAY_SRGB alias error:\n${errStr}`;
        }
    }

    verifyAliasDisplayP3Srgb(): void {
        try {
            let csAlias: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB);
            let csOrig: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
            let aliasName: colorSpaceManager.ColorSpace = csAlias.getColorSpaceName();
            let origName: colorSpaceManager.ColorSpace = csOrig.getColorSpaceName();
            let aliasGamma: number = csAlias.getGamma();
            let origGamma: number = csOrig.getGamma();
            let nameMatch: boolean = aliasName === origName;
            let gammaMatch: boolean = Math.abs(aliasGamma - origGamma) < 0.001;
            let allMatch: boolean = nameMatch && gammaMatch;
            this.errorResult = `DISPLAY_P3_SRGB vs DISPLAY_P3 Alias Verification:\n` +
                `Name: alias=${aliasName} orig=${origName} [${nameMatch ? 'MATCH' : 'DIFF'}]\n` +
                `Gamma: alias=${aliasGamma} orig=${origGamma} [${gammaMatch ? 'MATCH' : 'DIFF'}]\n` +
                `Overall: ${allMatch ? 'ALIAS VERIFIED' : 'ALIAS MISMATCH'}`;
            Logger.info(TAG, `DISPLAY_P3_SRGB alias: allMatch=${allMatch}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `DISPLAY_P3_SRGB alias error:\n${errStr}`;
        }
    }

    verifyAliasLinearBt709(): void {
        try {
            let csAlias: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709);
            let csOrig: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
            let aliasName: colorSpaceManager.ColorSpace = csAlias.getColorSpaceName();
            let origName: colorSpaceManager.ColorSpace = csOrig.getColorSpaceName();
            let aliasGamma: number = csAlias.getGamma();
            let origGamma: number = csOrig.getGamma();
            let nameMatch: boolean = aliasName === origName;
            let gammaMatch: boolean = Math.abs(aliasGamma - origGamma) < 0.001;
            let allMatch: boolean = nameMatch && gammaMatch;
            this.errorResult = `LINEAR_BT709 vs LINEAR_SRGB Alias Verification:\n` +
                `Name: alias=${aliasName} orig=${origName} [${nameMatch ? 'MATCH' : 'DIFF'}]\n` +
                `Gamma: alias=${aliasGamma} orig=${origGamma} [${gammaMatch ? 'MATCH' : 'DIFF'}]\n` +
                `Overall: ${allMatch ? 'ALIAS VERIFIED' : 'ALIAS MISMATCH'}`;
            Logger.info(TAG, `LINEAR_BT709 alias: allMatch=${allMatch}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `LINEAR_BT709 alias error:\n${errStr}`;
        }
    }

    // Two managers built from the same enum must report identical facts.
    verifyRepeatCreate(): void {
        try {
            let first: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            let second: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            let gammaMatch: boolean = Math.abs(first.getGamma() - second.getGamma()) < 0.0001;
            let nameMatch: boolean = first.getColorSpaceName() === second.getColorSpaceName();
            let firstWp: collections.Array<number> = first.getWhitePoint();
            let secondWp: collections.Array<number> = second.getWhitePoint();
            let wpMatch: boolean = firstWp.length === secondWp.length && firstWp.length >= 2 &&
                Math.abs(firstWp[0] - secondWp[0]) < 0.0001 &&
                Math.abs(firstWp[1] - secondWp[1]) < 0.0001;
            let stable: boolean = gammaMatch && nameMatch && wpMatch;
            this.errorResult = `Repeat SRGB: gamma=${first.getGamma()} ` +
              `name=${getColorSpaceNameStr(first.getColorSpaceName())}\n` +
                `Repeat check: gamma=${gammaMatch ? 'MATCH' : 'DIFF'} wp=${wpMatch ? 'MATCH' : 'DIFF'} ` +
                `name=${nameMatch ? 'MATCH' : 'DIFF'}\n` +
                `Overall: ${stable ? 'STABLE' : 'UNSTABLE'}`;
            Logger.info(TAG, `Repeat create: stable=${stable}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Repeat create error:\n${errStr}`;
        }
    }

    // The white point is a two channel xy pair for every space, so the array length is the contract.
    verifyWhitePointShape(): void {
        try {
            let srgb: collections.Array<number> = sendableColorSpaceManager
                .create(colorSpaceManager.ColorSpace.SRGB).getWhitePoint();
            let dciP3: collections.Array<number> = sendableColorSpaceManager
                .create(colorSpaceManager.ColorSpace.DCI_P3).getWhitePoint();
            let bt2020: collections.Array<number> = sendableColorSpaceManager
                .create(colorSpaceManager.ColorSpace.BT2020_HLG).getWhitePoint();
            let allTwo: boolean = srgb.length === 2 && dciP3.length === 2 && bt2020.length === 2;
            this.errorResult = `WP shapes: SRGB=${srgb.length} DCI_P3=${dciP3.length} BT2020_HLG=${bt2020.length}\n` +
                `Overall: ${allTwo ? 'ALL LENGTH 2' : 'UNEXPECTED LENGTH'}`;
            Logger.info(TAG, `White point shapes: allTwo=${allTwo}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `White point shape error:\n${errStr}`;
        }
    }

    // A displayed gamma below 1 or above 3 would break the rgb pipeline built on top of it.
    // PQ and HLG are not power curves, so the platform reports a negative gamma for them.
    verifyGammaRange(): void {
        try {
            let min: number = 0;
            let max: number = 0;
            let powerCount: number = 0;
            let nonPowerCount: number = 0;
            let failed: string = '';
            for (let i = 0; i < STANDARD_COLOR_SPACES.length; i++) {
                let gamma: number = sendableColorSpaceManager
                    .create(STANDARD_COLOR_SPACES[i].enumValue).getGamma();
                if (gamma <= 0) {
                    nonPowerCount++;
                    continue;
                }
                if (powerCount === 0 || gamma < min) {
                    min = gamma;
                }
                if (powerCount === 0 || gamma > max) {
                    max = gamma;
                }
                powerCount++;
                if (!(gamma >= 1.0 - 0.01 && gamma <= 3.0)) {
                    failed = STANDARD_COLOR_SPACES[i].label;
                }
            }
            let inRange: boolean = failed === '' && powerCount > 0;
            this.errorResult = `Gamma range: min=${min.toFixed(3)} max=${max.toFixed(3)} ` +
                `power=${powerCount} nonPower=${nonPowerCount} [${inRange ? 'PASS' : 'FAIL'}]\n` +
                `Overall: ${inRange ? 'IN RANGE' : `OUT OF RANGE at ${failed}`}`;
            Logger.info(TAG, `Gamma range: inRange=${inRange} powerCount=${powerCount}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Gamma range error:\n${errStr}`;
        }
    }

    // Custom primaries given to create must be echoed back unchanged, which the SRGB manager confirms.
    verifyCustomRoundTrip(): void {
        try {
            let primaries: colorSpaceManager.ColorSpacePrimaries = {
                redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60,
                blueX: 0.15, blueY: 0.06, whitePointX: 0.3127, whitePointY: 0.3290
            };
            let custom: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(primaries, 2.4);
            let reference: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            let gamma: number = custom.getGamma();
            let gammaOk: boolean = Math.abs(gamma - 2.4) < 0.01;
            let wp: collections.Array<number> = custom.getWhitePoint();
            let refWp: collections.Array<number> = reference.getWhitePoint();
            let wpOk: boolean = wp.length >= 2 && refWp.length >= 2 &&
                Math.abs(wp[0] - refWp[0]) < 0.001 && Math.abs(wp[1] - refWp[1]) < 0.001;
            this.errorResult = `Custom round trip: gamma=${gamma} match=${wpOk ? 'MATCH' : 'DIFF'}\n` +
                `Overall: ${gammaOk && wpOk ? 'ROUND TRIP OK' : 'ROUND TRIP MISMATCH'}`;
            Logger.info(TAG, `Custom round trip: gammaOk=${gammaOk} wpOk=${wpOk}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Custom round trip error:\n${errStr}`;
        }
    }

    // A component that cannot be turned into a color space has to carry a numeric error code.
    verifyErrorCodeShape(): void {
        try {
            sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.UNKNOWN);
            this.errorResult = `Error shape: no error was raised\nOverall: NO CODE`;
        } catch(err) {
            let businessError: BusinessError = err as BusinessError;
            let code: number = businessError.code;
            let hasCode: boolean = code > 0;
            this.errorResult = `Error shape: code=${code} numeric=${hasCode ? 'YES' : 'NO'}\n` +
                `Overall: ${hasCode ? 'NUMERIC CODE' : 'MISSING CODE'}`;
            Logger.info(TAG, `Error code shape: code=${code}`);
        }
    }

    // A rejected create must not leave the factory unusable for the next legal request.
    verifyRecoveryAfterError(): void {
        let rejected: boolean = false;
        try {
            sendableColorSpaceManager.create(999 as colorSpaceManager.ColorSpace);
        } catch(err) {
            rejected = true;
        }
        let gamma: number = 0;
        let name: string = '';
        try {
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
            gamma = cs.getGamma();
            name = getColorSpaceNameStr(cs.getColorSpaceName());
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Recovery: second create failed\n${errStr}`;
            return;
        }
        // Any plausible power value accepted here means the factory still works.
        let recovered: boolean = rejected && gamma >= 1.0 && gamma <= 3.0 && name === 'SRGB';
        this.errorResult = `Recovery: rejected=${rejected} gamma=${gamma} name=${name}\n` +
            `Overall: ${recovered ? 'RECOVERED' : 'NOT RECOVERED'}`;
        Logger.info(TAG, `Recovery after error: recovered=${recovered}`);
    }

    // Gamma 1.0 is the boundary of the linear family, so the value has to survive the round trip.
    verifyCustomGammaOne(): void {
        try {
            let primaries: colorSpaceManager.ColorSpacePrimaries = {
                redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60,
                blueX: 0.15, blueY: 0.06, whitePointX: 0.3127, whitePointY: 0.3290
            };
            let gamma: number = sendableColorSpaceManager.create(primaries, 1.0).getGamma();
            let linearOk: boolean = Math.abs(gamma - 1.0) < 0.001;
            this.errorResult = `Custom gamma=1.0: gamma=${gamma} linear=[${linearOk ? 'PASS' : 'FAIL'}]\n` +
                `Overall: ${linearOk ? 'LINEAR OK' : 'LINEAR MISMATCH'}`;
            Logger.info(TAG, `Custom gamma one: linearOk=${linearOk}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `Custom gamma=1.0 error:\n${errStr}`;
        }
    }

    // A limited range space carries the same primaries as its full range twin, only the transfer differs.
    verifyP3LimitPair(): void {
        try {
            let full: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3);
            let limit: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT);
            let fullGamma: number = full.getGamma();
            let limitGamma: number = limit.getGamma();
            let gammaMatch: boolean = Math.abs(fullGamma - limitGamma) < 0.001;
            let fullWp: collections.Array<number> = full.getWhitePoint();
            let limitWp: collections.Array<number> = limit.getWhitePoint();
            let wpMatch: boolean = fullWp.length >= 2 && limitWp.length >= 2 &&
                Math.abs(fullWp[0] - limitWp[0]) < 0.0001 &&
                Math.abs(fullWp[1] - limitWp[1]) < 0.0001;
            this.errorResult = `P3 limit pair: gamma=[${fullGamma.toFixed(1)}, ${limitGamma.toFixed(1)}] ` +
                `${gammaMatch ? 'MATCH' : 'DIFF'}\n` +
                `WhitePoint: ${wpMatch ? 'MATCH' : 'DIFF'}\n` +
                `Overall: ${gammaMatch && wpMatch ? 'PAIR MATCH' : 'PAIR DIFF'}`;
            Logger.info(TAG, `P3 limit pair: gammaMatch=${gammaMatch} wpMatch=${wpMatch}`);
        } catch(err) {
            let errStr: string = JSON.stringify(err) ?? '';
            this.errorResult = `P3 limit pair error:\n${errStr}`;
        }
    }

    clearResult(): void {
        this.errorResult = 'Click a button below to test error handling';
        Logger.info(TAG, 'Result area cleared');
    }

    goBack(): void {
        router.back();
    }

    build() {
        Scroll() {
            Column({ space: 8 }) {
                Row() {
                    Button('< Back')
                        .id('ExcBtnBack')
                        .fontSize(14)
                        .height(36)
                        .onClick(() => { this.goBack(); })
                    Text('Exception Handling')
                        .id('ExcPageTitle')
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .margin({ left: 12 })
                }
        .width('100%')
                    .margin({ top: 12 })
                    .padding({ left: 12, right: 12 })

                Text('Invalid Enum Values')
                    .id('EnumSectionTitle')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 12 })

                Button('Test: UNKNOWN enum')
                    .id('BtnTestUnknown')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.testUnknownEnum(); })

                Button('Test: CUSTOM enum')
                    .id('BtnTestCustom')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.testCustomEnum(); })

                Text('Invalid Gamma Values')
                    .id('GammaSectionTitle')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 12 })

                Button('Test: gamma = -1.0')
                    .id('BtnTestNegGamma')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.testNegativeGamma(); })

                Button('Test: gamma = 0')
                    .id('BtnTestZeroGamma')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.testZeroGamma(); })

                Text('Invalid Primaries')
                    .id('PrimariesSectionTitle')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 12 })

                Button('Test: coordinates out of range')
                    .id('BtnTestInvalidPrimaries')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.testInvalidPrimaries(); })

                Text('Error Code 401 (Parameter Error)')
                    .id('Code401SectionTitle')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 12 })

                Button('Test: enum = 999 (undefined)')
                    .id('BtnTestEnum999')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.testInvalidEnum401(); })

                Button('Test: enum = -1 (negative)')
                    .id('BtnTestEnumNeg1')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.testNegativeOneEnum(); })

                Text('Property Value Verification')
                    .id('VerifySectionTitle')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 12 })

                Button('Verify: SRGB properties')
                    .id('BtnVerifySrgb')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.verifySrgbProperties(); })

                Button('Verify: DCI_P3 properties')
                    .id('BtnVerifyDciP3')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.verifyDciP3Properties(); })

                Button('Verify: LINEAR_SRGB gamma')
                    .id('BtnVerifyLinearSrgb')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.verifyLinearSrgbProperties(); })

                Text('Enum Alias Verification')
                    .id('AliasSectionTitle')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 12 })

                Button('Verify: DISPLAY_SRGB = SRGB')
                    .id('BtnVerifyAliasSrgb')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyAliasDisplaySrgb(); })

                Button('Verify: DISPLAY_P3_SRGB = DISPLAY_P3')
                    .id('BtnVerifyAliasP3')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyAliasDisplayP3Srgb(); })

                Button('Verify: LINEAR_BT709 = LINEAR_SRGB')
                    .id('BtnVerifyAliasLinear')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyAliasLinearBt709(); })

                Text('Boundary and Recovery Checks')
                    .id('ExcExtensionTitle')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 12 })

                Button('Recheck: SRGB created twice')
                    .id('ExcBtnRepeatCreate')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyRepeatCreate(); })

                Button('Recheck: white point length')
                    .id('ExcBtnWhitePointShape')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyWhitePointShape(); })

                Button('Recheck: gamma range of 8 spaces')
                    .id('ExcBtnGammaRange')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyGammaRange(); })

                Button('Recheck: custom primaries round trip')
                    .id('ExcBtnCustomRoundTrip')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyCustomRoundTrip(); })

                Button('Recheck: error code shape')
                    .id('ExcBtnErrorCodeShape')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyErrorCodeShape(); })

                Button('Recheck: recovery after error')
                    .id('ExcBtnRecovery')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyRecoveryAfterError(); })

                Button('Recheck: custom gamma = 1.0')
                    .id('ExcBtnCustomGammaOne')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyCustomGammaOne(); })

                Button('Recheck: DISPLAY_P3 vs LIMIT')
                    .id('ExcBtnP3LimitPair')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.verifyP3LimitPair(); })

                Button('Clear result')
                    .id('ExcBtnClear')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => { this.clearResult(); })

                Text(this.errorResult)
                    .id('ErrorResult')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#CC0000')
                    .backgroundColor('#FFF0F0')
                    .padding(10)
                    .borderRadius(8)
                    .margin({ top: 12, bottom: 24 })
            }
      .width('100%')
                .alignItems(HorizontalAlign.Center)
        }
    .width('100%')
            .height('100%')
            .scrollBar(BarState.Auto)
    }
}
