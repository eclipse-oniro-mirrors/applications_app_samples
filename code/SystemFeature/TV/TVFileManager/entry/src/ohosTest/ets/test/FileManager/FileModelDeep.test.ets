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
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { FileInfo } from '../../../../main/ets/common/data/FileInfo';
import {
  checkSuffix,
  SUFFIX_AUDIO,
  SUFFIX_IMAGE,
  SUFFIX_VIDEO,
  SUFFIX_TEXT
} from '../../../../main/ets/common/ConstantsMedia';
import { MediaType } from '../../../../main/ets/model/MediaType';
import { DateTools } from '../../../../main/ets/common/utils/DateTools';
import { Tools } from '../../../../main/ets/common/utils/Tools';
import {
  createBean,
  createFileInfo,
  VIDEO_NAMES,
  AUDIO_NAMES,
  IMAGE_NAMES,
  DOC_NAMES,
  UNKNOWN_NAMES
} from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function fileModelDeepTest() {
  describe('FileModelDeep', () => {
    /*
     * Construction from FileInfo and the placeholder constructor used for skeleton rows.
     */
    describe('FileModelDeep_FileBean_Construction', () => {
      it('bean_fake_constructor_marks_dir', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_fake_constructor_marks_dir');
        let bean: FileBean = new FileBean();
        expect(bean.name.indexOf('fake')).assertEqual(0);
        expect(bean.isDir()).assertTrue();
      });

      it('bean_from_info_copies_uri_and_name', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_from_info_copies_uri_and_name');
        let info: FileInfo = createFileInfo('file://a/b/c.mp4', 'c.mp4', 2048, 1700000000, 'video/mp4', 1, '/a/b/');
        let bean: FileBean = new FileBean('one', info);
        expect(bean.id).assertEqual('file://a/b/c.mp4');
        expect(bean.name).assertEqual('c.mp4');
        expect(bean.size).assertEqual(2048);
      });

      it('bean_from_root_info_sets_device', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_from_root_info_sets_device');
        let info: FileInfo = createFileInfo('file://root/', 'Internal', 0, 0, 'Root', 2, '/', true, 0);
        let bean: FileBean = new FileBean('root', info);
        expect(bean.isRoot).assertTrue();
        expect(bean.isDevice()).assertTrue();
      });

      it('bean_size_and_time_getters', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_size_and_time_getters');
        let info: FileInfo = createFileInfo('file://a/x.txt', 'x.txt', 512, 1710000000, 'text/plain', 1, '/a/');
        let bean: FileBean = new FileBean('x', info);
        expect(bean.size).assertEqual(512);
        expect(bean.time).assertEqual(1710000000);
      });
    });

    /*
     * Suffix classification drives row icon and click behaviour.
     */
    describe('FileModelDeep_FileBean_Type_Detection', () => {
      it('video_extension_mp4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: video_extension_mp4');
        let bean: FileBean = createBean('clip.mp4');
        expect(bean.isVideo()).assertTrue();
        expect(bean.isAudio()).assertFalse();
      });

      it('audio_extension_mp3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_extension_mp3');
        let bean: FileBean = createBean('song.mp3');
        expect(bean.isAudio()).assertTrue();
        expect(bean.isVideo()).assertFalse();
      });

      it('image_extension_jpg', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_extension_jpg');
        let bean: FileBean = createBean('photo.jpg');
        expect(bean.isImage()).assertTrue();
      });

      it('doc_extension_pdf', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: doc_extension_pdf');
        let bean: FileBean = createBean('report.pdf');
        expect(bean.isDoc()).assertTrue();
      });

      it('uppercase_extension_is_detected', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: uppercase_extension_is_detected');
        let bean: FileBean = createBean('MOVIE.MP4');
        expect(bean.isVideo()).assertTrue();
      });

      it('unknown_extension_is_not_media', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: unknown_extension_is_not_media');
        let bean: FileBean = createBean('archive.zip');
        expect(bean.isVideo()).assertFalse();
        expect(bean.isAudio()).assertFalse();
        expect(bean.isImage()).assertFalse();
        expect(bean.isDoc()).assertFalse();
      });
    });

    /*
     * Selection, rename and image dimensions consumed by the grid.
     */
    describe('FileModelDeep_FileBean_State_And_Path', () => {
      it('checked_flag_round_trip', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checked_flag_round_trip');
        let bean: FileBean = createBean('a.txt');
        bean.isChecked = true;
        expect(bean.isChecked).assertTrue();
        bean.isChecked = false;
        expect(bean.isChecked).assertFalse();
      });

      it('set_path_returns_new_path', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_path_returns_new_path');
        let bean: FileBean = createBean('a.txt');
        let path: string = bean.setPath('file://new/a.txt');
        expect(path).assertEqual('file://new/a.txt');
        expect(bean.getPath()).assertEqual('file://new/a.txt');
      });

      it('rename_updates_name', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rename_updates_name');
        let bean: FileBean = createBean('a.txt');
        bean.name = 'b.txt';
        expect(bean.name).assertEqual('b.txt');
      });

      it('image_dimensions_default_zero', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_dimensions_default_zero');
        let bean: FileBean = createBean('a.png');
        expect(bean.imageWidth).assertEqual(0);
        expect(bean.hasImageDimensions()).assertFalse();
      });

      it('image_dimensions_update', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_dimensions_update');
        let bean: FileBean = createBean('a.png');
        bean.setImageDimensions(96, 54);
        expect(bean.imageWidth).assertEqual(96);
        expect(bean.imageHeight).assertEqual(54);
        expect(bean.hasImageDimensions()).assertTrue();
      });

      it('media_type_flag_round_trip', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: media_type_flag_round_trip');
        let bean: FileBean = createBean('a.jpg');
        expect(bean.isMediaFile()).assertFalse();
        bean.setFileType(1);
        expect(bean.isMediaFile()).assertTrue();
      });
    });

    /*
     * Extended boundary, type and matrix coverage for FileModelDeep derived from the reference suite.
     */
    describe('FileModelDeep_Extended_Coverage', () => {
      /*
       * Suffix matrix for movie.mp4.
       */
      it('bean_matrix_type_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_0');
        let bean: FileBean = createBean('movie.mp4');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for clip.avi.
       */
      it('bean_matrix_type_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_1');
        let bean: FileBean = createBean('clip.avi');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for sample.mkv.
       */
      it('bean_matrix_type_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_2');
        let bean: FileBean = createBean('sample.mkv');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for trailer.mov.
       */
      it('bean_matrix_type_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_3');
        let bean: FileBean = createBean('trailer.mov');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for stream.ts.
       */
      it('bean_matrix_type_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_4');
        let bean: FileBean = createBean('stream.ts');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for video.webm.
       */
      it('bean_matrix_type_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_5');
        let bean: FileBean = createBean('video.webm');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for film.m4v.
       */
      it('bean_matrix_type_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_6');
        let bean: FileBean = createBean('film.m4v');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for show.mpg.
       */
      it('bean_matrix_type_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_7');
        let bean: FileBean = createBean('show.mpg');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for drama.rmvb.
       */
      it('bean_matrix_type_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_8');
        let bean: FileBean = createBean('drama.rmvb');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for anime.flv.
       */
      it('bean_matrix_type_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_9');
        let bean: FileBean = createBean('anime.flv');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for MOVIE.MP4.
       */
      it('bean_matrix_type_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_10');
        let bean: FileBean = createBean('MOVIE.MP4');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for CLIP.AVI.
       */
      it('bean_matrix_type_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_11');
        let bean: FileBean = createBean('CLIP.AVI');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for sample.MKV.
       */
      it('bean_matrix_type_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_12');
        let bean: FileBean = createBean('sample.MKV');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for trailer.MOV.
       */
      it('bean_matrix_type_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_13');
        let bean: FileBean = createBean('trailer.MOV');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for stream.TS.
       */
      it('bean_matrix_type_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_14');
        let bean: FileBean = createBean('stream.TS');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for video.WEBM.
       */
      it('bean_matrix_type_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_15');
        let bean: FileBean = createBean('video.WEBM');
        expect(bean.isVideo()).assertEqual(true);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for song.mp3.
       */
      it('bean_matrix_type_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_16');
        let bean: FileBean = createBean('song.mp3');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for track.aac.
       */
      it('bean_matrix_type_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_17');
        let bean: FileBean = createBean('track.aac');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for sound.flac.
       */
      it('bean_matrix_type_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_18');
        let bean: FileBean = createBean('sound.flac');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for voice.m4a.
       */
      it('bean_matrix_type_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_19');
        let bean: FileBean = createBean('voice.m4a');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for record.wav.
       */
      it('bean_matrix_type_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_20');
        let bean: FileBean = createBean('record.wav');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for audio.ogg.
       */
      it('bean_matrix_type_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_21');
        let bean: FileBean = createBean('audio.ogg');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for music.ape.
       */
      it('bean_matrix_type_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_22');
        let bean: FileBean = createBean('music.ape');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for podcast.wma.
       */
      it('bean_matrix_type_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_23');
        let bean: FileBean = createBean('podcast.wma');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for SONG.MP3.
       */
      it('bean_matrix_type_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_24');
        let bean: FileBean = createBean('SONG.MP3');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for TRACK.AAC.
       */
      it('bean_matrix_type_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_25');
        let bean: FileBean = createBean('TRACK.AAC');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for sound.FLAC.
       */
      it('bean_matrix_type_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_26');
        let bean: FileBean = createBean('sound.FLAC');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for voice.M4A.
       */
      it('bean_matrix_type_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_27');
        let bean: FileBean = createBean('voice.M4A');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(true);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for photo.jpg.
       */
      it('bean_matrix_type_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_28');
        let bean: FileBean = createBean('photo.jpg');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for picture.jpeg.
       */
      it('bean_matrix_type_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_29');
        let bean: FileBean = createBean('picture.jpeg');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for icon.png.
       */
      it('bean_matrix_type_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_30');
        let bean: FileBean = createBean('icon.png');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for banner.webp.
       */
      it('bean_matrix_type_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_31');
        let bean: FileBean = createBean('banner.webp');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for scan.bmp.
       */
      it('bean_matrix_type_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_32');
        let bean: FileBean = createBean('scan.bmp');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for anim.gif.
       */
      it('bean_matrix_type_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_33');
        let bean: FileBean = createBean('anim.gif');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for vector.svg.
       */
      it('bean_matrix_type_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_34');
        let bean: FileBean = createBean('vector.svg');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for PHOTO.JPG.
       */
      it('bean_matrix_type_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_35');
        let bean: FileBean = createBean('PHOTO.JPG');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for PICTURE.JPEG.
       */
      it('bean_matrix_type_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_36');
        let bean: FileBean = createBean('PICTURE.JPEG');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for icon.PNG.
       */
      it('bean_matrix_type_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_37');
        let bean: FileBean = createBean('icon.PNG');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for banner.WEBP.
       */
      it('bean_matrix_type_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_38');
        let bean: FileBean = createBean('banner.WEBP');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(true);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for report.pdf.
       */
      it('bean_matrix_type_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_39');
        let bean: FileBean = createBean('report.pdf');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for notes.txt.
       */
      it('bean_matrix_type_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_40');
        let bean: FileBean = createBean('notes.txt');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for plan.doc.
       */
      it('bean_matrix_type_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_41');
        let bean: FileBean = createBean('plan.doc');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for plan.docx.
       */
      it('bean_matrix_type_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_42');
        let bean: FileBean = createBean('plan.docx');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for data.xls.
       */
      it('bean_matrix_type_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_43');
        let bean: FileBean = createBean('data.xls');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for data.xlsx.
       */
      it('bean_matrix_type_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_44');
        let bean: FileBean = createBean('data.xlsx');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for slides.ppt.
       */
      it('bean_matrix_type_45', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_45');
        let bean: FileBean = createBean('slides.ppt');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for slides.pptx.
       */
      it('bean_matrix_type_46', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_46');
        let bean: FileBean = createBean('slides.pptx');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for REPORT.PDF.
       */
      it('bean_matrix_type_47', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_47');
        let bean: FileBean = createBean('REPORT.PDF');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for NOTES.TXT.
       */
      it('bean_matrix_type_48', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_48');
        let bean: FileBean = createBean('NOTES.TXT');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for data.XLS.
       */
      it('bean_matrix_type_49', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_49');
        let bean: FileBean = createBean('data.XLS');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(true);
      });

      /*
       * Suffix matrix for archive.zip.
       */
      it('bean_matrix_type_50', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_50');
        let bean: FileBean = createBean('archive.zip');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for binary.bin.
       */
      it('bean_matrix_type_51', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_51');
        let bean: FileBean = createBean('binary.bin');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for package.hap.
       */
      it('bean_matrix_type_52', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_52');
        let bean: FileBean = createBean('package.hap');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for noextension.
       */
      it('bean_matrix_type_53', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_53');
        let bean: FileBean = createBean('noextension');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for .
       */
      it('bean_matrix_type_54', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_54');
        let bean: FileBean = createBean('');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for file..
       */
      it('bean_matrix_type_55', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_55');
        let bean: FileBean = createBean('file.');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for weird.zzz.
       */
      it('bean_matrix_type_56', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_56');
        let bean: FileBean = createBean('weird.zzz');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for .hidden.
       */
      it('bean_matrix_type_57', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_57');
        let bean: FileBean = createBean('.hidden');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Suffix matrix for name.with.many.dots.mp4.bak.
       */
      it('bean_matrix_type_58', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_type_58');
        let bean: FileBean = createBean('name.with.many.dots.mp4.bak');
        expect(bean.isVideo()).assertEqual(false);
        expect(bean.isAudio()).assertEqual(false);
        expect(bean.isImage()).assertEqual(false);
        expect(bean.isDoc()).assertEqual(false);
      });

      /*
       * Path and size integrity for movie.mp4.
       */
      it('bean_matrix_path_59', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_59');
        let bean: FileBean = createBean('movie.mp4', 60);
        expect(bean.getPath()).assertContain('movie.mp4');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(60);
      });

      /*
       * Path and size integrity for clip.avi.
       */
      it('bean_matrix_path_60', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_60');
        let bean: FileBean = createBean('clip.avi', 61);
        expect(bean.getPath()).assertContain('clip.avi');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(61);
      });

      /*
       * Path and size integrity for sample.mkv.
       */
      it('bean_matrix_path_61', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_61');
        let bean: FileBean = createBean('sample.mkv', 62);
        expect(bean.getPath()).assertContain('sample.mkv');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(62);
      });

      /*
       * Path and size integrity for trailer.mov.
       */
      it('bean_matrix_path_62', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_62');
        let bean: FileBean = createBean('trailer.mov', 63);
        expect(bean.getPath()).assertContain('trailer.mov');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(63);
      });

      /*
       * Path and size integrity for stream.ts.
       */
      it('bean_matrix_path_63', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_63');
        let bean: FileBean = createBean('stream.ts', 64);
        expect(bean.getPath()).assertContain('stream.ts');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(64);
      });

      /*
       * Path and size integrity for video.webm.
       */
      it('bean_matrix_path_64', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_64');
        let bean: FileBean = createBean('video.webm', 65);
        expect(bean.getPath()).assertContain('video.webm');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(65);
      });

      /*
       * Path and size integrity for film.m4v.
       */
      it('bean_matrix_path_65', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_65');
        let bean: FileBean = createBean('film.m4v', 66);
        expect(bean.getPath()).assertContain('film.m4v');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(66);
      });

      /*
       * Path and size integrity for show.mpg.
       */
      it('bean_matrix_path_66', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_66');
        let bean: FileBean = createBean('show.mpg', 67);
        expect(bean.getPath()).assertContain('show.mpg');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(67);
      });

      /*
       * Path and size integrity for drama.rmvb.
       */
      it('bean_matrix_path_67', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_67');
        let bean: FileBean = createBean('drama.rmvb', 68);
        expect(bean.getPath()).assertContain('drama.rmvb');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(68);
      });

      /*
       * Path and size integrity for anime.flv.
       */
      it('bean_matrix_path_68', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_68');
        let bean: FileBean = createBean('anime.flv', 69);
        expect(bean.getPath()).assertContain('anime.flv');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(69);
      });

      /*
       * Path and size integrity for MOVIE.MP4.
       */
      it('bean_matrix_path_69', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_69');
        let bean: FileBean = createBean('MOVIE.MP4', 70);
        expect(bean.getPath()).assertContain('MOVIE.MP4');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(70);
      });

      /*
       * Path and size integrity for CLIP.AVI.
       */
      it('bean_matrix_path_70', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_70');
        let bean: FileBean = createBean('CLIP.AVI', 71);
        expect(bean.getPath()).assertContain('CLIP.AVI');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(71);
      });

      /*
       * Path and size integrity for sample.MKV.
       */
      it('bean_matrix_path_71', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_71');
        let bean: FileBean = createBean('sample.MKV', 72);
        expect(bean.getPath()).assertContain('sample.MKV');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(72);
      });

      /*
       * Path and size integrity for trailer.MOV.
       */
      it('bean_matrix_path_72', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_72');
        let bean: FileBean = createBean('trailer.MOV', 73);
        expect(bean.getPath()).assertContain('trailer.MOV');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(73);
      });

      /*
       * Path and size integrity for stream.TS.
       */
      it('bean_matrix_path_73', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_73');
        let bean: FileBean = createBean('stream.TS', 74);
        expect(bean.getPath()).assertContain('stream.TS');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(74);
      });

      /*
       * Path and size integrity for video.WEBM.
       */
      it('bean_matrix_path_74', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_74');
        let bean: FileBean = createBean('video.WEBM', 75);
        expect(bean.getPath()).assertContain('video.WEBM');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(75);
      });

      /*
       * Path and size integrity for song.mp3.
       */
      it('bean_matrix_path_75', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_75');
        let bean: FileBean = createBean('song.mp3', 76);
        expect(bean.getPath()).assertContain('song.mp3');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(76);
      });

      /*
       * Path and size integrity for track.aac.
       */
      it('bean_matrix_path_76', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: bean_matrix_path_76');
        let bean: FileBean = createBean('track.aac', 77);
        expect(bean.getPath()).assertContain('track.aac');
        expect(bean.getPath()).assertContain('file://');
        expect(bean.size).assertEqual(77);
      });
    });
  });
}
