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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Tools } from '../../../../main/ets/common/utils/Tools';
import { DateTools } from '../../../../main/ets/common/utils/DateTools';
import { checkSuffix, SUFFIX_AUDIO, SUFFIX_IMAGE, SUFFIX_VIDEO, SUFFIX_TEXT } from '../../../../main/ets/common/ConstantsMedia';
import { TABS, MEDIA_TYPE } from '../../../../main/ets/common/Constants';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { createBean, VIDEO_NAMES, AUDIO_NAMES, IMAGE_NAMES, DOC_NAMES, UNKNOWN_NAMES, INVALID_STRINGS, SAMPLE_SIZES } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function exceptionHandlingTest() {
  describe('ExceptionHandling', () => {
    /*
     * The suffix lists are the only source of truth for file classification.
     */
    describe('ExceptionHandling_Suffix_Validation', () => {
      it('video_list_has_mp4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: video_list_has_mp4');
        expect(SUFFIX_VIDEO.indexOf('mp4') >= 0 || SUFFIX_VIDEO.indexOf('.mp4') >= 0).assertTrue();
      });

      it('audio_list_has_mp3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_list_has_mp3');
        expect(SUFFIX_AUDIO.indexOf('mp3') >= 0 || SUFFIX_AUDIO.indexOf('.mp3') >= 0).assertTrue();
      });

      it('image_list_has_png', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_list_has_png');
        expect(SUFFIX_IMAGE.indexOf('png') >= 0 || SUFFIX_IMAGE.indexOf('.png') >= 0).assertTrue();
      });

      it('text_list_has_pdf', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: text_list_has_pdf');
        expect(SUFFIX_TEXT.indexOf('pdf') >= 0 || SUFFIX_TEXT.indexOf('.pdf') >= 0).assertTrue();
      });

      it('case_insensitive_matching', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: case_insensitive_matching');
        expect(checkSuffix('A.MP4', SUFFIX_VIDEO)).assertTrue();
        expect(checkSuffix('B.MP3', SUFFIX_AUDIO)).assertTrue();
      });

      it('empty_name_never_matches', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_name_never_matches');
        expect(checkSuffix('', SUFFIX_VIDEO)).assertFalse();
      });

      it('wrong_list_never_matches', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: wrong_list_never_matches');
        expect(checkSuffix('a.mp4', SUFFIX_AUDIO)).assertFalse();
      });
    });

    /*
     * User input is validated before a file operation is started.
     */
    describe('ExceptionHandling_Input_Validation', () => {
    it('empty_string_detected', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_string_detected');
      expect(Tools.isEmpty('')).assertTrue();
    });

    it('space_is_not_empty', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: space_is_not_empty');
      expect(Tools.isEmpty(' ')).assertFalse();
    });

    it('null_like_text_is_not_empty', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: null_like_text_is_not_empty');
      expect(Tools.isEmpty('null')).assertFalse();
    });

    it('sample_sizes_are_non_negative', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sample_sizes_are_non_negative');
      for (let i = 0; i < SAMPLE_SIZES.length; i++) {
      expect(SAMPLE_SIZES[i] >= 0).assertTrue();
      }
    });

    it('byte2str_never_empty', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: byte2str_never_empty');
      for (let i = 0; i < SAMPLE_SIZES.length; i++) {
      expect(Tools.byte2Str(SAMPLE_SIZES[i]).length > 0).assertTrue();
      }
    });
    });

    /*
     * Timestamps from the media store are rendered in the list footer.
     */
    describe('ExceptionHandling_Date_Format_Validation', () => {
    it('format_date_default', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_date_default');
      let text: string = DateTools.formatDate(1700000000000);
      expect(text.length).assertEqual(10);
    });

    it('format_date_custom', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_date_custom');
      let text: string = DateTools.formatDate(1700000000000, 'yyyy-MM-dd HH:mm:ss');
      expect(text.length).assertEqual(19);
    });

    it('format_date_empty_input', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_date_empty_input');
      expect(DateTools.formatDate('')).assertEqual('');
    });

    it('format_date_zero', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_date_zero');
      expect(DateTools.formatDate(0)).assertEqual('');
    });
    });

    /*
     * Extended boundary, type and matrix coverage for ExceptionHandling derived from the reference suite.
     */
    describe('ExceptionHandling_Extended_Coverage', () => {
    it('validation_suffix_matrix_0', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_0');
      let bean: FileBean = createBean('movie.mp4');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_1');
      let text: string = DateTools.formatDate(1600086400000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_2');
      let value: string = '\n';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_3');
      expect(Tools.byte2Str(1024).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_4');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_5');
      let bean: FileBean = createBean('file5.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_6');
      let bean: FileBean = createBean('film.m4v');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_7');
      let text: string = DateTools.formatDate(1600604800000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_8');
      let value: string = '';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_9');
      expect(Tools.byte2Str(1).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_10');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_11');
      let bean: FileBean = createBean('file11.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_12');
      let bean: FileBean = createBean('sample.MKV');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_13');
      let text: string = DateTools.formatDate(1601123200000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_14');
      let value: string = '0';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_15');
      expect(Tools.byte2Str(1099511627776).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_16', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_16');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_17', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_17');
      let bean: FileBean = createBean('file17.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_18', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_18');
      let bean: FileBean = createBean('sound.flac');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_19', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_19');
      let text: string = DateTools.formatDate(1601641600000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_20', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_20');
      let value: string = 'undefined';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_21', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_21');
      expect(Tools.byte2Str(1048576).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_22', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_22');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_23', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_23');
      let bean: FileBean = createBean('file23.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_24', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_24');
      let bean: FileBean = createBean('SONG.MP3');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_25', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_25');
      let text: string = DateTools.formatDate(1602160000000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_26', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_26');
      let value: string = '\n';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_27', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_27');
      expect(Tools.byte2Str(1024).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_28', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_28');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_29', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_29');
      let bean: FileBean = createBean('file29.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_30', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_30');
      let bean: FileBean = createBean('icon.png');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_31', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_31');
      let text: string = DateTools.formatDate(1602678400000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_32', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_32');
      let value: string = '';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_33', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_33');
      expect(Tools.byte2Str(1).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_34', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_34');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_35', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_35');
      let bean: FileBean = createBean('file35.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_36', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_36');
      let bean: FileBean = createBean('PICTURE.JPEG');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_37', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_37');
      let text: string = DateTools.formatDate(1603196800000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_38', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_38');
      let value: string = '0';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_39', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_39');
      expect(Tools.byte2Str(1099511627776).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_40', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_40');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_41', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_41');
      let bean: FileBean = createBean('file41.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_42', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_42');
      let bean: FileBean = createBean('plan.docx');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_43', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_43');
      let text: string = DateTools.formatDate(1603715200000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_44', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_44');
      let value: string = 'undefined';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_45', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_45');
      expect(Tools.byte2Str(1048576).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_46', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_46');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_47', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_47');
      let bean: FileBean = createBean('file47.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_48', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_48');
      let bean: FileBean = createBean('NOTES.TXT');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_49', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_49');
      let text: string = DateTools.formatDate(1604233600000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_50', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_50');
      let value: string = '\n';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_51', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_51');
      expect(Tools.byte2Str(1024).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_52', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_52');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_53', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_53');
      let bean: FileBean = createBean('file53.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_54', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_54');
      let bean: FileBean = createBean('');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_55', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_55');
      let text: string = DateTools.formatDate(1604752000000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_56', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_56');
      let value: string = '';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_57', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_57');
      expect(Tools.byte2Str(1).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_58', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_58');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_59', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_59');
      let bean: FileBean = createBean('file59.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_60', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_60');
      let bean: FileBean = createBean('clip.avi');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_61', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_61');
      let text: string = DateTools.formatDate(1605270400000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_62', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_62');
      let value: string = '0';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_63', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_63');
      expect(Tools.byte2Str(1099511627776).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_64', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_64');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_65', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_65');
      let bean: FileBean = createBean('file65.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_66', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_66');
      let bean: FileBean = createBean('show.mpg');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_67', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_67');
      let text: string = DateTools.formatDate(1605788800000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_68', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_68');
      let value: string = 'undefined';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_69', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_69');
      expect(Tools.byte2Str(1048576).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_70', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_70');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_71', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_71');
      let bean: FileBean = createBean('file71.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_72', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_72');
      let bean: FileBean = createBean('trailer.MOV');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_73', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_73');
      let text: string = DateTools.formatDate(1606307200000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_74', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_74');
      let value: string = '\n';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_75', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_75');
      expect(Tools.byte2Str(1024).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_76', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_76');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_77', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_77');
      let bean: FileBean = createBean('file77.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_78', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_78');
      let bean: FileBean = createBean('voice.m4a');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_79', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_79');
      let text: string = DateTools.formatDate(1606825600000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_80', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_80');
      let value: string = '';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_81', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_81');
      expect(Tools.byte2Str(1).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_82', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_82');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_83', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_83');
      let bean: FileBean = createBean('file83.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_84', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_84');
      let bean: FileBean = createBean('TRACK.AAC');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_85', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_85');
      let text: string = DateTools.formatDate(1607344000000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_86', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_86');
      let value: string = '0';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_87', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_87');
      expect(Tools.byte2Str(1099511627776).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_88', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_88');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_89', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_89');
      let bean: FileBean = createBean('file89.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_90', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_90');
      let bean: FileBean = createBean('banner.webp');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_91', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_91');
      let text: string = DateTools.formatDate(1607862400000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_92', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_92');
      let value: string = 'undefined';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_93', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_93');
      expect(Tools.byte2Str(1048576).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_94', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_94');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_95', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_95');
      let bean: FileBean = createBean('file95.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_96', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_96');
      let bean: FileBean = createBean('icon.PNG');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_97', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_97');
      let text: string = DateTools.formatDate(1608380800000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_98', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_98');
      let value: string = '\n';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_99', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_99');
      expect(Tools.byte2Str(1024).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_100');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_101');
      let bean: FileBean = createBean('file101.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_102');
      let bean: FileBean = createBean('data.xls');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_103');
      let text: string = DateTools.formatDate(1608899200000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_104');
      let value: string = '';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_105');
      expect(Tools.byte2Str(1).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_106');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_107');
      let bean: FileBean = createBean('file107.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_108');
      let bean: FileBean = createBean('data.XLS');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_109');
      let text: string = DateTools.formatDate(1609417600000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_110');
      let value: string = '0';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_111');
      expect(Tools.byte2Str(1099511627776).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_112');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_113');
      let bean: FileBean = createBean('file113.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_114');
      let bean: FileBean = createBean('file.');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_115');
      let text: string = DateTools.formatDate(1609936000000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_116');
      let value: string = 'undefined';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_117');
      expect(Tools.byte2Str(1048576).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_118');
      let list: string[] = SUFFIX_IMAGE;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_119');
      let bean: FileBean = createBean('file119.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_120');
      let bean: FileBean = createBean('sample.mkv');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });

    it('validation_date_matrix_121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_date_matrix_121');
      let text: string = DateTools.formatDate(1610454400000, 'yyyy-MM-dd');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('-')).assertLarger(-1);
    });

    it('validation_empty_matrix_122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_empty_matrix_122');
      let value: string = '\n';
      expect(Tools.isEmpty(value)).assertEqual(value.length === 0);
    });

    it('validation_size_matrix_123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_size_matrix_123');
      expect(Tools.byte2Str(1024).length > 0).assertTrue();
    });

    it('validation_suffix_array_matrix_124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_array_matrix_124');
      let list: string[] = SUFFIX_VIDEO;
      expect(list.length > 0).assertTrue();
      let unique: Set<string> = new Set(list);
      expect(unique.size).assertEqual(list.length);
    });

    it('validation_bean_matrix_125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_bean_matrix_125');
      let bean: FileBean = createBean('file125.dat');
      expect(bean.isVideo() || bean.isAudio() || bean.isImage() || bean.isDoc()).assertFalse();
      expect(bean.isMediaFile()).assertFalse();
    });

    it('validation_suffix_matrix_126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: validation_suffix_matrix_126');
      let bean: FileBean = createBean('drama.rmvb');
      expect(checkSuffix(bean.name, SUFFIX_VIDEO)).assertEqual(bean.isVideo());
      expect(checkSuffix(bean.name, SUFFIX_AUDIO)).assertEqual(bean.isAudio());
      expect(checkSuffix(bean.name, SUFFIX_IMAGE)).assertEqual(bean.isImage());
      expect(checkSuffix(bean.name, SUFFIX_TEXT)).assertEqual(bean.isDoc());
    });
    });
  });
}
