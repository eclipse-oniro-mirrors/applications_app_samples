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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

const DOMAIN: number = 0xF814;
const TAG: string = 'DrawingColorCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

interface DrawingColor4 {
  alpha: number;
  red: number;
  green: number;
  blue: number;
}

function makeColor(alpha: number, red: number, green: number, blue: number): DrawingColor4 {
  const color: DrawingColor4 = { alpha: alpha, red: red, green: green, blue: blue };
  return color;
}

function hexDigitValue(ch: string): number {
  if (ch.length !== 1) {
    return -1;
  }
  const code: number = ch.charCodeAt(0);
  if (code >= 48 && code <= 57) {
    return code - 48;
  }
  if (code >= 97 && code <= 102) {
    return code - 87;
  }
  if (code >= 65 && code <= 70) {
    return code - 55;
  }
  return -1;
}

function parseHexColor(hex: string): DrawingColor4 {
  const invalid: DrawingColor4 = { alpha: 0, red: 0, green: 0, blue: 0 };
  let body: string = hex;
  if (body.length > 0 && body.charAt(0) === '#') {
    body = body.substring(1);
  }
  if (body.length !== 6 && body.length !== 8) {
    return invalid;
  }
  const values: number[] = [];
  for (let i: number = 0; i < body.length; i++) {
    const v: number = hexDigitValue(body.charAt(i));
    if (v < 0) {
      return invalid;
    }
    values.push(v);
  }
  if (body.length === 8) {
    const out8: DrawingColor4 = {
      alpha: values[0] * 16 + values[1],
      red: values[2] * 16 + values[3],
      green: values[4] * 16 + values[5],
      blue: values[6] * 16 + values[7]
    };
    return out8;
  }
  const out6: DrawingColor4 = {
    alpha: 255,
    red: values[0] * 16 + values[1],
    green: values[2] * 16 + values[3],
    blue: values[4] * 16 + values[5]
  };
  return out6;
}

function isValidHexColor(hex: string): boolean {
  let body: string = hex;
  if (body.length > 0 && body.charAt(0) === '#') {
    body = body.substring(1);
  }
  if (body.length !== 6 && body.length !== 8) {
    return false;
  }
  for (let i: number = 0; i < body.length; i++) {
    if (hexDigitValue(body.charAt(i)) < 0) {
      return false;
    }
  }
  return true;
}

function toHex2(value: number): string {
  const digits: string = '0123456789ABCDEF';
  const hi: number = Math.floor(value / 16);
  const lo: number = value % 16;
  return digits.charAt(hi) + digits.charAt(lo);
}

function colorToHexString(color: DrawingColor4): string {
  return toHex2(color.alpha) + toHex2(color.red) + toHex2(color.green) + toHex2(color.blue);
}

export default function drawingColorCoreTest(): void {
  describe('DrawingColorCoreTest', () => {
    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0001
     * @tc.name      testDrawingColor0001
     * @tc.desc      Verify makeColor stores the pure red sample color fields exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0001 begin');
      const color: DrawingColor4 = makeColor(0xFF, 0xFF, 0x00, 0x00);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0001 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0002
     * @tc.name      testDrawingColor0002
     * @tc.desc      Verify makeColor stores the pure blue sample color fields exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0002 begin');
      const color: DrawingColor4 = makeColor(0xFF, 0x00, 0x00, 0xFF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0002 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0003
     * @tc.name      testDrawingColor0003
     * @tc.desc      Verify makeColor stores the sample title color 0xFF4472C3 fields exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0003 begin');
      const color: DrawingColor4 = makeColor(0xFF, 0x44, 0x72, 0xC3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=68`);
      expect(color.red).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=114`);
      expect(color.green).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=195`);
      expect(color.blue).assertEqual(195);
      log('testDrawingColor0003 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0004
     * @tc.name      testDrawingColor0004
     * @tc.desc      Verify the parsed color model is an object type to prevent type degradation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0004 begin');
      const color: DrawingColor4 = makeColor(1, 2, 3, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color=${typeof color}, expected='object'`);
      expect(typeof color).assertEqual('object');
      log('testDrawingColor0004 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0005
     * @tc.name      testDrawingColor0005
     * @tc.desc      Verify every parsed color field keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0005 begin');
      const color: DrawingColor4 = makeColor(1, 2, 3, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.alpha=${typeof color.alpha}, expected='number'`);
      expect(typeof color.alpha).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.red=${typeof color.red}, expected='number'`);
      expect(typeof color.red).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.green=${typeof color.green}, expected='number'`);
      expect(typeof color.green).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof color.blue=${typeof color.blue}, expected='number'`);
      expect(typeof color.blue).assertEqual('number');
      log('testDrawingColor0005 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0006
     * @tc.name      testDrawingColor0006
     * @tc.desc      Verify a fully transparent color keeps alpha zero and channels intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0006 begin');
      const color: DrawingColor4 = makeColor(0, 255, 255, 255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0006 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0007
     * @tc.name      testDrawingColor0007
     * @tc.desc      Verify the maximum channel values are accepted and stored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0007 begin');
      const color: DrawingColor4 = makeColor(255, 255, 255, 255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0007 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0008
     * @tc.name      testDrawingColor0008
     * @tc.desc      Verify two color model instances are independent value copies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0008 begin');
      const first: DrawingColor4 = makeColor(255, 0, 0, 0);
      const second: DrawingColor4 = makeColor(255, 0, 0, 0);
      first.red = 123;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.red=${second.red}, expected=0`);
      expect(second.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.red=${first.red}, expected=123`);
      expect(first.red).assertEqual(123);
      log('testDrawingColor0008 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0009
     * @tc.name      testDrawingColor0009
     * @tc.desc      Verify parsing six digit hex #FF0000 yields opaque red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0009 begin');
      const color: DrawingColor4 = parseHexColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0009 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0010
     * @tc.name      testDrawingColor0010
     * @tc.desc      Verify parsing six digit hex #00FF00 yields opaque green.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0010 begin');
      const color: DrawingColor4 = parseHexColor('#00FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0010 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0011
     * @tc.name      testDrawingColor0011
     * @tc.desc      Verify parsing six digit hex #0000FF yields opaque blue.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0011 begin');
      const color: DrawingColor4 = parseHexColor('#0000FF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0011 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0012
     * @tc.name      testDrawingColor0012
     * @tc.desc      Verify parsing #FFFFFF yields opaque white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0012 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0012 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0013
     * @tc.name      testDrawingColor0013
     * @tc.desc      Verify parsing #000000 yields opaque black.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0013 begin');
      const color: DrawingColor4 = parseHexColor('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0013 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0014
     * @tc.name      testDrawingColor0014
     * @tc.desc      Verify parsing mixed digit hex #123456 yields exact channel values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0014 begin');
      const color: DrawingColor4 = parseHexColor('#123456');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=18`);
      expect(color.red).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=52`);
      expect(color.green).assertEqual(52);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=86`);
      expect(color.blue).assertEqual(86);
      log('testDrawingColor0014 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0015
     * @tc.name      testDrawingColor0015
     * @tc.desc      Verify parsing upper case hex letters #ABCDEF yields exact values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0015 begin');
      const color: DrawingColor4 = parseHexColor('#ABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=171`);
      expect(color.red).assertEqual(171);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=205`);
      expect(color.green).assertEqual(205);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=239`);
      expect(color.blue).assertEqual(239);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      log('testDrawingColor0015 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0016
     * @tc.name      testDrawingColor0016
     * @tc.desc      Verify lower case and upper case hex input produce the same color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0016 begin');
      const lower: DrawingColor4 = parseHexColor('#abcdef');
      const upper: DrawingColor4 = parseHexColor('#ABCDEF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lower.red=${lower.red}, expected=upper.red`);
      expect(lower.red).assertEqual(upper.red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lower.green=${lower.green}, expected=upper.green`);
      expect(lower.green).assertEqual(upper.green);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lower.blue=${lower.blue}, expected=upper.blue`);
      expect(lower.blue).assertEqual(upper.blue);
      log('testDrawingColor0016 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0017
     * @tc.name      testDrawingColor0017
     * @tc.desc      Verify six digit hex without the hash prefix parses identically.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0017 begin');
      const plain: DrawingColor4 = parseHexColor('FF0000');
      const hashed: DrawingColor4 = parseHexColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.alpha=${plain.alpha}, expected=hashed.alpha`);
      expect(plain.alpha).assertEqual(hashed.alpha);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.red=${plain.red}, expected=hashed.red`);
      expect(plain.red).assertEqual(hashed.red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.green=${plain.green}, expected=hashed.green`);
      expect(plain.green).assertEqual(hashed.green);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.blue=${plain.blue}, expected=hashed.blue`);
      expect(plain.blue).assertEqual(hashed.blue);
      log('testDrawingColor0017 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0018
     * @tc.name      testDrawingColor0018
     * @tc.desc      Verify parsing eight digit hex 80FF0000 yields semi transparent red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0018 begin');
      const color: DrawingColor4 = parseHexColor('80FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0018 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0019
     * @tc.name      testDrawingColor0019
     * @tc.desc      Verify parsing eight digit hashed hex #80FF0000 yields alpha 128 red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0019 begin');
      const color: DrawingColor4 = parseHexColor('#80FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=128`);
      expect(color.alpha).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      log('testDrawingColor0019 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0020
     * @tc.name      testDrawingColor0020
     * @tc.desc      Verify parsing fully transparent red #00FF0000 keeps alpha zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0020 begin');
      const color: DrawingColor4 = parseHexColor('#00FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0020 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0021
     * @tc.name      testDrawingColor0021
     * @tc.desc      Verify parsing #40FFFFFF yields alpha 64 white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0021 begin');
      const color: DrawingColor4 = parseHexColor('#40FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=64`);
      expect(color.alpha).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=255`);
      expect(color.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=255`);
      expect(color.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=255`);
      expect(color.blue).assertEqual(255);
      log('testDrawingColor0021 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0022
     * @tc.name      testDrawingColor0022
     * @tc.desc      Verify parsing #C3123456 yields alpha 195 with exact channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0022 begin');
      const color: DrawingColor4 = parseHexColor('#C3123456');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=195`);
      expect(color.alpha).assertEqual(195);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=18`);
      expect(color.red).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=52`);
      expect(color.green).assertEqual(52);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=86`);
      expect(color.blue).assertEqual(86);
      log('testDrawingColor0022 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0023
     * @tc.name      testDrawingColor0023
     * @tc.desc      Verify parsing eight digit FF000000 without hash yields opaque black.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0023 begin');
      const color: DrawingColor4 = parseHexColor('FF000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=255`);
      expect(color.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0023 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0024
     * @tc.name      testDrawingColor0024
     * @tc.desc      Verify an empty hex string parses to the all zero invalid color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0024 begin');
      const color: DrawingColor4 = parseHexColor('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0024 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0025
     * @tc.name      testDrawingColor0025
     * @tc.desc      Verify a lone hash prefix parses to the invalid color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0025 begin');
      const color: DrawingColor4 = parseHexColor('#');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      log('testDrawingColor0025 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0026
     * @tc.name      testDrawingColor0026
     * @tc.desc      Verify a three digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0026 begin');
      const color: DrawingColor4 = parseHexColor('#FFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0026 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0027
     * @tc.name      testDrawingColor0027
     * @tc.desc      Verify a four digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0027 begin');
      const color: DrawingColor4 = parseHexColor('#FFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0027 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0028
     * @tc.name      testDrawingColor0028
     * @tc.desc      Verify a five digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0028 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0028 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0029
     * @tc.name      testDrawingColor0029
     * @tc.desc      Verify a seven digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0029 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      log('testDrawingColor0029 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0030
     * @tc.name      testDrawingColor0030
     * @tc.desc      Verify a nine digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0030 begin');
      const color: DrawingColor4 = parseHexColor('#FFFFFF000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.green=${color.green}, expected=0`);
      expect(color.green).assertEqual(0);
      log('testDrawingColor0030 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0031
     * @tc.name      testDrawingColor0031
     * @tc.desc      Verify non hex letters in the body are rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0031 begin');
      const color: DrawingColor4 = parseHexColor('#GGHHII');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.red=${color.red}, expected=0`);
      expect(color.red).assertEqual(0);
      log('testDrawingColor0031 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0032
     * @tc.name      testDrawingColor0032
     * @tc.desc      Verify a named color word is rejected as invalid hex input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0032 begin');
      const color: DrawingColor4 = parseHexColor('red');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.blue=${color.blue}, expected=0`);
      expect(color.blue).assertEqual(0);
      log('testDrawingColor0032 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0033
     * @tc.name      testDrawingColor0033
     * @tc.desc      Verify embedded whitespace in hex input is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0033 begin');
      const color: DrawingColor4 = parseHexColor('#FF 000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0033 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0034
     * @tc.name      testDrawingColor0034
     * @tc.desc      Verify repeated hash prefixes make the body too long and invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0034 begin');
      const color: DrawingColor4 = parseHexColor('####FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0034 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0035
     * @tc.name      testDrawingColor0035
     * @tc.desc      Verify a single digit hex string is rejected as invalid.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0035 begin');
      const color: DrawingColor4 = parseHexColor('#F');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual color.alpha=${color.alpha}, expected=0`);
      expect(color.alpha).assertEqual(0);
      log('testDrawingColor0035 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0036
     * @tc.name      testDrawingColor0036
     * @tc.desc      Verify isValidHexColor accepts the six digit hashed form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0036 begin');
      const valid: boolean = isValidHexColor('#FF0000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue valid=${valid}`);
      expect(valid).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof valid=${typeof valid}, expected='boolean'`);
      expect(typeof valid).assertEqual('boolean');
      log('testDrawingColor0036 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0037
     * @tc.name      testDrawingColor0037
     * @tc.desc      Verify isValidHexColor accepts #00FF00.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0037 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#00FF00')=${isValidHexColor('#00FF00')}`);
      expect(isValidHexColor('#00FF00')).assertTrue();
      log('testDrawingColor0037 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0038
     * @tc.name      testDrawingColor0038
     * @tc.desc      Verify isValidHexColor accepts upper case letter hex #ABCDEF.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0038 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#ABCDEF')=${isValidHexColor('#ABCDEF')}`);
      expect(isValidHexColor('#ABCDEF')).assertTrue();
      log('testDrawingColor0038 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0039
     * @tc.name      testDrawingColor0039
     * @tc.desc      Verify isValidHexColor accepts lower case letter hex.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0039 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#abcdef')=${isValidHexColor('#abcdef')}`);
      expect(isValidHexColor('#abcdef')).assertTrue();
      log('testDrawingColor0039 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0040
     * @tc.name      testDrawingColor0040
     * @tc.desc      Verify isValidHexColor accepts the hash free six digit form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0040 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('FF0000')=${isValidHexColor('FF0000')}`);
      expect(isValidHexColor('FF0000')).assertTrue();
      log('testDrawingColor0040 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0041
     * @tc.name      testDrawingColor0041
     * @tc.desc      Verify isValidHexColor accepts the eight digit alpha form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0041 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('#80FF0000')=${isValidHexColor('#80FF0000')}`);
      expect(isValidHexColor('#80FF0000')).assertTrue();
      log('testDrawingColor0041 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0042
     * @tc.name      testDrawingColor0042
     * @tc.desc      Verify isValidHexColor rejects the empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0042 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('')=${isValidHexColor('')}`);
      expect(isValidHexColor('')).assertFalse();
      log('testDrawingColor0042 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0043
     * @tc.name      testDrawingColor0043
     * @tc.desc      Verify isValidHexColor rejects a lone hash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0043 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#')=${isValidHexColor('#')}`);
      expect(isValidHexColor('#')).assertFalse();
      log('testDrawingColor0043 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0044
     * @tc.name      testDrawingColor0044
     * @tc.desc      Verify isValidHexColor rejects the three digit form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0044 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#FFF')=${isValidHexColor('#FFF')}`);
      expect(isValidHexColor('#FFF')).assertFalse();
      log('testDrawingColor0044 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0045
     * @tc.name      testDrawingColor0045
     * @tc.desc      Verify isValidHexColor rejects non hex letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0045 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#GGGGGG')=${isValidHexColor('#GGGGGG')}`);
      expect(isValidHexColor('#GGGGGG')).assertFalse();
      log('testDrawingColor0045 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0046
     * @tc.name      testDrawingColor0046
     * @tc.desc      Verify isValidHexColor rejects named color words.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0046 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('red')=${isValidHexColor('red')}`);
      expect(isValidHexColor('red')).assertFalse();
      log('testDrawingColor0046 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0047
     * @tc.name      testDrawingColor0047
     * @tc.desc      Verify isValidHexColor rejects hex containing whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0047 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#FF00 0')=${isValidHexColor('#FF00 0')}`);
      expect(isValidHexColor('#FF00 0')).assertFalse();
      log('testDrawingColor0047 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0048
     * @tc.name      testDrawingColor0048
     * @tc.desc      Verify isValidHexColor rejects seven digit hex.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0048 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#FF00000')=${isValidHexColor('#FF00000')}`);
      expect(isValidHexColor('#FF00000')).assertFalse();
      log('testDrawingColor0048 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0049
     * @tc.name      testDrawingColor0049
     * @tc.desc      Verify isValidHexColor accepts the hash free eight digit form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0049 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isValidHexColor('FF000000')=${isValidHexColor('FF000000')}`);
      expect(isValidHexColor('FF000000')).assertTrue();
      log('testDrawingColor0049 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_COLOR_0050
     * @tc.name      testDrawingColor0050
     * @tc.desc      Verify isValidHexColor rejects a five digit body.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingColor0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingColor0050 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isValidHexColor('#12345')=${isValidHexColor('#12345')}`);
      expect(isValidHexColor('#12345')).assertFalse();
      log('testDrawingColor0050 end');
    })

  })
}
