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
import uri from '@ohos.uri';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.URI;

const FULL_URI: string = 'https://example.com:8080/path/to/animation?x=1&y=2#fragment';

/**
 * URI parsing contract used when the sample resolves animation sources. Every
 * case parses an in-memory string through the uri module, so no network or
 * file access is involved.
 */
export default function uriParseTest(): void {
  describe('LottieUriParseTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0100
     * @tc.name schemeExtracted001
     * @tc.desc Verify the scheme of an absolute HTTPS URI is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'schemeExtracted_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'schemeExtracted_001 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: string = parsed.scheme;
      Logger.info(TAG, 'schemeExtracted_001, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('https');
      Logger.info(TAG, 'schemeExtracted_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0200
     * @tc.name hostExtracted002
     * @tc.desc Verify the host of an absolute HTTPS URI is parsed without the port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hostExtracted_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hostExtracted_002 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: string = parsed.host;
      Logger.info(TAG, 'hostExtracted_002, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('example.com');
      Logger.info(TAG, 'hostExtracted_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0300
     * @tc.name portExtracted003
     * @tc.desc Verify the port of an absolute HTTPS URI is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'portExtracted_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'portExtracted_003 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: string = parsed.port;
      Logger.info(TAG, 'portExtracted_003, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('8080');
      Logger.info(TAG, 'portExtracted_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0400
     * @tc.name pathExtracted004
     * @tc.desc Verify the path of an absolute HTTPS URI is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pathExtracted_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pathExtracted_004 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: string = parsed.path;
      Logger.info(TAG, 'pathExtracted_004, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('/path/to/animation');
      Logger.info(TAG, 'pathExtracted_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0500
     * @tc.name queryExtracted005
     * @tc.desc Verify the query of an absolute HTTPS URI is parsed with both parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'queryExtracted_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'queryExtracted_005 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: string = parsed.query;
      Logger.info(TAG, 'queryExtracted_005, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('x=1&y=2');
      Logger.info(TAG, 'queryExtracted_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0600
     * @tc.name fragmentExtracted006
     * @tc.desc Verify the fragment of an absolute HTTPS URI is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fragmentExtracted_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fragmentExtracted_006 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: string = parsed.fragment;
      Logger.info(TAG, 'fragmentExtracted_006, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('fragment');
      Logger.info(TAG, 'fragmentExtracted_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0700
     * @tc.name absoluteUriDetected007
     * @tc.desc Verify an HTTPS URI is reported as absolute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'absoluteUriDetected_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'absoluteUriDetected_007 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: boolean = parsed.checkIsAbsolute();
      Logger.info(TAG, 'absoluteUriDetected_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'absoluteUriDetected_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0800
     * @tc.name relativeUriDetected008
     * @tc.desc Verify a path only URI is reported as relative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'relativeUriDetected_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'relativeUriDetected_008 begin');
      const parsed: uri.URI = new uri.URI('/path/to/animation?x=1');
      const check01: boolean = parsed.checkIsAbsolute();
      Logger.info(TAG, 'relativeUriDetected_008, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'relativeUriDetected_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_0900
     * @tc.name equalUriDetected009
     * @tc.desc Verify two URIs built from the same text compare as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'equalUriDetected_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'equalUriDetected_009 begin');
      const first: uri.URI = new uri.URI(FULL_URI);
      const second: uri.URI = new uri.URI(FULL_URI);
      const check01: boolean = first.equalsTo(second);
      Logger.info(TAG, 'equalUriDetected_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'equalUriDetected_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_1000
     * @tc.name differentUriDetected010
     * @tc.desc Verify URIs with different paths compare as different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'differentUriDetected_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'differentUriDetected_010 begin');
      const first: uri.URI = new uri.URI('https://example.com/a');
      const second: uri.URI = new uri.URI('https://example.com/b');
      const check01: boolean = first.equalsTo(second);
      Logger.info(TAG, 'differentUriDetected_010, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'differentUriDetected_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_1100
     * @tc.name textRoundTrip011
     * @tc.desc Verify the textual form survives a parse and format round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'textRoundTrip_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'textRoundTrip_011 begin');
      const parsed: uri.URI = new uri.URI(FULL_URI);
      const check01: string = parsed.toString();
      Logger.info(TAG, 'textRoundTrip_011, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(FULL_URI);
      Logger.info(TAG, 'textRoundTrip_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_1200
     * @tc.name pathAndQueryTogether012
     * @tc.desc Verify a relative URI separates its path from its query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pathAndQueryTogether_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pathAndQueryTogether_012 begin');
      const parsed: uri.URI = new uri.URI('/path/to/animation?x=1');
      const check01: string = parsed.path;
      Logger.info(TAG, 'pathAndQueryTogether_012, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('/path/to/animation');
      const check02: string = parsed.query;
      Logger.info(TAG, 'pathAndQueryTogether_012, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('x=1');
      Logger.info(TAG, 'pathAndQueryTogether_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URI_1300
     * @tc.name fragmentWithPath013
     * @tc.desc Verify a fragment is separated from the path of a relative URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fragmentWithPath_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fragmentWithPath_013 begin');
      const parsed: uri.URI = new uri.URI('/path/to/animation#fragment');
      const check01: string = parsed.path;
      Logger.info(TAG, 'fragmentWithPath_013, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual('/path/to/animation');
      const check02: string = parsed.fragment;
      Logger.info(TAG, 'fragmentWithPath_013, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('fragment');
      Logger.info(TAG, 'fragmentWithPath_013 end');
    });

  });
}
