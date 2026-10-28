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

const DEFAULT_ALBUM_WIDTH: number = 640;

const CACHE_ALBUM_MIN_WIDTH: number = 1920;

const TYPE_IMAGE: string = 'image';

const TYPE_VIDEO: string = 'video';

const THUMB_SUFFIX: string = '.thumb';

interface MediaModel {
  uri: string;
  width: number;
  height: number;
  type: string;
}

// Mirrors fileModelsEquals behavior in LoadUtil.ets
class MediaListComparator {
  public static equals(first: MediaModel[], second: MediaModel[]): boolean {
    if (first.length !== second.length) {
      return false;
    }
    for (let i = 0; i < first.length; i++) {
      if (first[i].uri !== second[i].uri) {
        return false;
      }
    }
    return true;
  }

  public static contains(models: MediaModel[], uri: string): boolean {
    for (let i = 0; i < models.length; i++) {
      if (models[i].uri === uri) {
        return true;
      }
    }
    return false;
  }

  public static indexOf(models: MediaModel[], uri: string): number {
    for (let i = 0; i < models.length; i++) {
      if (models[i].uri === uri) {
        return i;
      }
    }
    return -1;
  }

  public static uniqueUris(models: MediaModel[]): string[] {
    const seen: Set<string> = new Set<string>();
    const result: string[] = [];
    for (let i = 0; i < models.length; i++) {
      if (!seen.has(models[i].uri)) {
        seen.add(models[i].uri);
        result.push(models[i].uri);
      }
    }
    return result;
  }
}

// Computes thumbnail dimensions with the 640px baseline
class ThumbScaleCalculator {
  public static shouldUseOriginal(model: MediaModel): boolean {
    return model.type === TYPE_IMAGE && model.width > 0 && model.width <= CACHE_ALBUM_MIN_WIDTH;
  }

  public static scale(model: MediaModel): number {
    const widthScale = model.width <= 0 ? 1 : model.width / DEFAULT_ALBUM_WIDTH;
    const heightScale = model.height <= 0 ? 1 : model.height / DEFAULT_ALBUM_WIDTH;
    // Use the larger scale so that the whole picture fits inside the thumb box.
    const scale = widthScale > heightScale ? widthScale : heightScale;
    return scale <= 0 ? 1 : scale;
  }

  public static thumbWidth(model: MediaModel): number {
    const scale = ThumbScaleCalculator.scale(model);
    return Math.round((model.width <= 0 ? DEFAULT_ALBUM_WIDTH : model.width) / scale);
  }

  public static thumbHeight(model: MediaModel): number {
    const scale = ThumbScaleCalculator.scale(model);
    return Math.round((model.height <= 0 ? DEFAULT_ALBUM_WIDTH : model.height) / scale);
  }

  public static isLandscape(model: MediaModel): boolean {
    return model.width > model.height;
  }
}

// Builds cache file names from media URIs
class ThumbPathBuilder {
  public static localName(uri: string): string {
    return uri.split('file://').join('').split('/').join('_') + THUMB_SUFFIX;
  }

  public static cachePath(cacheDir: string, uri: string): string {
    const base = cacheDir.endsWith('/') ? cacheDir : cacheDir + '/';
    return base + ThumbPathBuilder.localName(uri);
  }

  public static toFileUri(path: string): string {
    return path.startsWith('file://') ? path : 'file://' + path;
  }

  public static isThumbName(name: string): boolean {
    return name.endsWith(THUMB_SUFFIX);
  }

  public static isSafeName(name: string): boolean {
    return name.length > 0 && name.indexOf('..') < 0 && name.indexOf('/') < 0 &&
      name.indexOf('\\') < 0;
  }
}

// Validates media items before thumbnail generation
class MediaValidator {
  public static isTypeValid(type: string): boolean {
    return type === TYPE_IMAGE || type === TYPE_VIDEO;
  }

  public static isUriValid(uri: string): boolean {
    return uri.length > 0 && (uri.startsWith('file://') || uri.startsWith('datashare://'));
  }

  public static isDimensionValid(model: MediaModel): boolean {
    return model.width >= 0 && model.height >= 0;
  }

  public static isValid(model: MediaModel): boolean {
    return MediaValidator.isTypeValid(model.type) && MediaValidator.isUriValid(model.uri) &&
      MediaValidator.isDimensionValid(model);
  }

  public static requiresThumb(model: MediaModel): boolean {
    return MediaValidator.isValid(model) && !ThumbScaleCalculator.shouldUseOriginal(model);
  }
}

// Summarizes thumbnail generation work for a batch
class ThumbBatchReport {
  private total: number = 0;
  private originals: number = 0;
  private thumbs: number = 0;
  private invalid: number = 0;

  public record(model: MediaModel): void {
    this.total++;
    if (!MediaValidator.isValid(model)) {
      this.invalid++;
    } else if (ThumbScaleCalculator.shouldUseOriginal(model)) {
      this.originals++;
    } else {
      this.thumbs++;
    }
  }

  public getTotal(): number {
    return this.total;
  }

  public getOriginals(): number {
    return this.originals;
  }

  public getThumbs(): number {
    return this.thumbs;
  }

  public getInvalid(): number {
    return this.invalid;
  }

  public summary(): string {
    return `total=${this.total},originals=${this.originals},thumbs=${this.thumbs},invalid=${this.invalid}`;
  }

  public reset(): void {
    this.total = 0;
    this.originals = 0;
    this.thumbs = 0;
    this.invalid = 0;
  }
}

export default function loadUtilValidationTest() {
  describe('LoadUtilValidation_Test', () => {

    it('comparator_should_compare_uri_sequences', 0, () => {
      const first: MediaModel[] = [
        { uri: 'file://a', width: 100, height: 100, type: TYPE_IMAGE },
        { uri: 'file://b', width: 100, height: 100, type: TYPE_IMAGE }
      ];
      const second: MediaModel[] = [
        { uri: 'file://a', width: 50, height: 50, type: TYPE_VIDEO },
        { uri: 'file://b', width: 10, height: 10, type: TYPE_IMAGE }
      ];
      expect(MediaListComparator.equals(first, second)).assertTrue();
      second[1].uri = 'file://c';
      expect(MediaListComparator.equals(first, second)).assertFalse();
      expect(MediaListComparator.equals([], [])).assertTrue();
      expect(MediaListComparator.equals(first, [])).assertFalse();
    });

    it('comparator_should_find_and_deduplicate', 0, () => {
      const models: MediaModel[] = [
        { uri: 'file://a', width: 1, height: 1, type: TYPE_IMAGE },
        { uri: 'file://a', width: 1, height: 1, type: TYPE_IMAGE },
        { uri: 'file://b', width: 1, height: 1, type: TYPE_VIDEO }
      ];
      expect(MediaListComparator.contains(models, 'file://a')).assertTrue();
      expect(MediaListComparator.contains(models, 'file://missing')).assertFalse();
      expect(MediaListComparator.indexOf(models, 'file://b')).assertEqual(2);
      expect(MediaListComparator.indexOf(models, 'missing')).assertEqual(-1);
      expect(MediaListComparator.uniqueUris(models)).assertDeepEquals(['file://a', 'file://b']);
    });

    it('scale_should_keep_small_images_original', 0, () => {
      const small: MediaModel = { uri: 'file://a', width: 640, height: 480, type: TYPE_IMAGE };
      const wide: MediaModel = {
        uri: 'file://b', width: CACHE_ALBUM_MIN_WIDTH, height: 1080, type: TYPE_IMAGE
      };
      expect(ThumbScaleCalculator.shouldUseOriginal(small)).assertTrue();
      expect(ThumbScaleCalculator.shouldUseOriginal(wide)).assertTrue();
      expect(ThumbScaleCalculator.shouldUseOriginal({
        uri: 'file://c', width: CACHE_ALBUM_MIN_WIDTH + 1, height: 1080, type: TYPE_IMAGE
      })).assertFalse();
    });

    it('scale_should_not_keep_videos_original', 0, () => {
      const video: MediaModel = { uri: 'file://v', width: 640, height: 480, type: TYPE_VIDEO };
      expect(ThumbScaleCalculator.shouldUseOriginal(video)).assertFalse();
      expect(ThumbScaleCalculator.isLandscape(video)).assertTrue();
    });

    it('scale_should_compute_thumb_dimensions', 0, () => {
      const model: MediaModel = { uri: 'file://a', width: 1280, height: 960, type: TYPE_IMAGE };
      expect(ThumbScaleCalculator.scale(model)).assertEqual(2);
      expect(ThumbScaleCalculator.thumbWidth(model)).assertEqual(640);
      expect(ThumbScaleCalculator.thumbHeight(model)).assertEqual(480);
    });

    it('scale_should_handle_missing_dimensions', 0, () => {
      const model: MediaModel = { uri: 'file://a', width: 0, height: 0, type: TYPE_IMAGE };
      expect(ThumbScaleCalculator.scale(model)).assertEqual(1);
      expect(ThumbScaleCalculator.thumbWidth(model)).assertEqual(DEFAULT_ALBUM_WIDTH);
      expect(ThumbScaleCalculator.thumbHeight(model)).assertEqual(DEFAULT_ALBUM_WIDTH);
      expect(ThumbScaleCalculator.isLandscape(model)).assertFalse();
    });

    it('path_builder_should_build_thumb_names', 0, () => {
      expect(ThumbPathBuilder.localName('file://media/Photo/1/a.jpg'))
        .assertEqual('media_Photo_1_a.jpg.thumb');
      expect(ThumbPathBuilder.localName('file://a.jpg')).assertEqual('a.jpg.thumb');
      expect(ThumbPathBuilder.isThumbName('a.jpg.thumb')).assertTrue();
      expect(ThumbPathBuilder.isThumbName('a.jpg')).assertFalse();
    });

    it('path_builder_should_build_cache_paths', 0, () => {
      expect(ThumbPathBuilder.cachePath('/cache', 'file://a.jpg')).assertEqual('/cache/a.jpg.thumb');
      expect(ThumbPathBuilder.cachePath('/cache/', 'file://a.jpg')).assertEqual('/cache/a.jpg.thumb');
      expect(ThumbPathBuilder.cachePath('/cache', 'file://a.jpg').indexOf('//')).assertEqual(-1);
      expect(ThumbPathBuilder.toFileUri('/cache/a.thumb')).assertEqual('file:///cache/a.thumb');
      expect(ThumbPathBuilder.toFileUri('file:///cache/a.thumb')).assertEqual('file:///cache/a.thumb');
    });

    it('path_builder_should_reject_unsafe_names', 0, () => {
      expect(ThumbPathBuilder.isSafeName('a.jpg.thumb')).assertTrue();
      expect(ThumbPathBuilder.isSafeName('')).assertFalse();
      expect(ThumbPathBuilder.isSafeName('../a.thumb')).assertFalse();
      expect(ThumbPathBuilder.isSafeName('dir/a.thumb')).assertFalse();
      expect(ThumbPathBuilder.isSafeName('dir\\a.thumb')).assertFalse();
    });

    it('validator_should_check_media_models', 0, () => {
      expect(MediaValidator.isTypeValid(TYPE_IMAGE)).assertTrue();
      expect(MediaValidator.isTypeValid(TYPE_VIDEO)).assertTrue();
      expect(MediaValidator.isTypeValid('audio')).assertFalse();
      expect(MediaValidator.isUriValid('file://a')).assertTrue();
      expect(MediaValidator.isUriValid('datashare://a')).assertTrue();
      expect(MediaValidator.isUriValid('http://a')).assertFalse();
      expect(MediaValidator.isValid({
        uri: 'file://a', width: 100, height: 100, type: TYPE_IMAGE
      })).assertTrue();
    });

    it('validator_should_decide_thumb_requirement', 0, () => {
      const large: MediaModel = { uri: 'file://a', width: 3840, height: 2160, type: TYPE_IMAGE };
      const small: MediaModel = { uri: 'file://b', width: 320, height: 240, type: TYPE_IMAGE };
      const invalid: MediaModel = { uri: '', width: 3840, height: 2160, type: TYPE_IMAGE };
      expect(MediaValidator.requiresThumb(large)).assertTrue();
      expect(MediaValidator.requiresThumb(small)).assertFalse();
      expect(MediaValidator.requiresThumb(invalid)).assertFalse();
    });

    it('batch_report_should_classify_models', 0, () => {
      const report = new ThumbBatchReport();
      report.record({ uri: 'file://large', width: 3840, height: 2160, type: TYPE_IMAGE });
      report.record({ uri: 'file://small', width: 320, height: 240, type: TYPE_IMAGE });
      report.record({ uri: '', width: 100, height: 100, type: TYPE_IMAGE });
      expect(report.getTotal()).assertEqual(3);
      expect(report.getThumbs()).assertEqual(1);
      expect(report.getOriginals()).assertEqual(1);
      expect(report.getInvalid()).assertEqual(1);
      expect(report.summary()).assertEqual('total=3,originals=1,thumbs=1,invalid=1');
      report.reset();
      expect(report.getTotal()).assertEqual(0);
    });

    it('load_util_constants_should_be_stable', 0, () => {
      expect(DEFAULT_ALBUM_WIDTH).assertEqual(640);
      expect(CACHE_ALBUM_MIN_WIDTH).assertEqual(1920);
      expect(TYPE_IMAGE).assertEqual('image');
      expect(TYPE_VIDEO).assertEqual('video');
      expect(THUMB_SUFFIX).assertEqual('.thumb');
    });
  });
}

