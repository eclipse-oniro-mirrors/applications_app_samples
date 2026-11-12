/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TranscodeQualityModel } from '../../model/TranscodeQualityModel';

@Component
export struct TranscodeQualityPanel {
  @ObjectLink quality: TranscodeQualityModel;
  @Prop allowFilter: boolean = true;
  @Prop allowArea: boolean = true;
  @Prop allowAudio: boolean = false;
  @Prop sourceChannels: number = 0;
  @Prop allowEditing: boolean = true;
  onChanged: () => void = (): void => {};

  private filters(): SelectOption[] {
    const options: SelectOption[] = [{ value: $r('app.string.transcode_filter_fast') },
      { value: $r('app.string.transcode_filter_linear') }];
    if (this.allowArea) { options.push({ value: $r('app.string.transcode_filter_area') }); }
    return options;
  }
  private resamplers(): SelectOption[] {
    return [{ value: $r('app.string.transcode_resampler_fast') },
      { value: $r('app.string.transcode_resampler_quality') }];
  }
  private rates(): SelectOption[] {
    return [{ value: $r('app.string.transcode_keep_source') }, { value: '24 fps' }, { value: '30 fps' },
      { value: '60 fps' }, { value: '120 fps' }];
  }
  private modes(): SelectOption[] { return [{ value: 'VBR' }, { value: 'CBR' }]; }
  private keys(): SelectOption[] {
    return [{ value: '1 s' }, { value: '2 s' }, { value: '3 s' }, { value: '5 s' }];
  }
  private audioRates(): SelectOption[] {
    return [{ value: $r('app.string.transcode_keep_source') }, { value: '44.1 kHz' }, { value: '48 kHz' }];
  }
  private channels(): SelectOption[] {
    const defaultChannels = this.sourceChannels === 6 ? $r('app.string.transcode_keep_source_5point1') :
      $r('app.string.transcode_keep_source');
    return [{ value: defaultChannels }, { value: $r('app.string.transcode_mono') },
      { value: $r('app.string.transcode_stereo') }];
  }
  private sourceLayouts(): SelectOption[] {
    return [{ value: $r('app.string.transcode_audio_layout_choose') },
      { value: $r('app.string.transcode_audio_layout_5point1_side') },
      { value: $r('app.string.transcode_audio_layout_5point1_back') }];
  }
  private audioBitrates(): SelectOption[] {
    return [{ value: '64 kbps' }, { value: '128 kbps' }, { value: '192 kbps' }];
  }

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.transcode_quality')).fontSize(17).fontWeight(FontWeight.Medium)
      Row() {
        Text($r('app.string.transcode_filter')).layoutWeight(1)
        Select(this.filters()).selected(this.quality.filter).value(this.filters()[this.quality.filter].value)
          .enabled(this.allowFilter)
          .onSelect((index: number): void => { this.quality.filter = index; this.onChanged(); })
      }
      Row() {
        Text($r('app.string.transcode_frame_limit')).layoutWeight(1)
        Select(this.rates()).selected(this.quality.frameRate).value(this.rates()[this.quality.frameRate].value)
          .onSelect((index: number): void => { this.quality.frameRate = index; this.onChanged(); })
      }
      Row() {
        Text($r('app.string.transcode_rate_control')).layoutWeight(1)
        Select(this.modes()).selected(this.quality.bitrateMode).value(this.modes()[this.quality.bitrateMode].value)
          .onSelect((index: number): void => { this.quality.bitrateMode = index; this.onChanged(); })
      }
      Row() {
        Text($r('app.string.transcode_key_interval')).layoutWeight(1)
        Select(this.keys()).selected(this.quality.keyFrame).value(this.keys()[this.quality.keyFrame].value)
          .onSelect((index: number): void => { this.quality.keyFrame = index; this.onChanged(); })
      }
      Text($r('app.string.transcode_quality_hint')).fontSize(12).fontColor('#667085')
      if (this.allowAudio) {
        Row() {
          Text($r('app.string.transcode_resampler')).layoutWeight(1)
          Select(this.resamplers()).selected(this.quality.audioResampler)
            .value(this.resamplers()[this.quality.audioResampler].value)
            .onSelect((index: number): void => { this.quality.audioResampler = index; this.onChanged(); })
        }
        Row() {
          Text($r('app.string.transcode_audio_rate')).layoutWeight(1)
          Select(this.audioRates()).selected(this.quality.audioRate)
            .value(this.audioRates()[this.quality.audioRate].value)
            .onSelect((index: number): void => { this.quality.audioRate = index; this.onChanged(); })
        }
        Row() {
          Text($r('app.string.transcode_audio_channels')).layoutWeight(1)
          Select(this.channels()).selected(this.quality.audioChannels)
            .value(this.channels()[this.quality.audioChannels].value)
            .onSelect((index: number): void => { this.quality.audioChannels = index; this.onChanged(); })
        }
        if (this.sourceChannels === 6) {
          Row() {
            Text($r('app.string.transcode_audio_source_layout')).layoutWeight(1)
            Select(this.sourceLayouts()).selected(this.quality.audioSourceLayout)
              .value(this.sourceLayouts()[this.quality.audioSourceLayout].value)
              .onSelect((index: number): void => { this.quality.audioSourceLayout = index; this.onChanged(); })
          }
          Text($r('app.string.transcode_audio_source_layout_hint')).fontSize(12).fontColor('#667085')
        }
        Row() {
          Text($r('app.string.transcode_audio_bitrate')).layoutWeight(1)
          Select(this.audioBitrates()).selected(this.quality.audioBitrate)
            .value(this.audioBitrates()[this.quality.audioBitrate].value)
            .onSelect((index: number): void => { this.quality.audioBitrate = index; this.onChanged(); })
        }
        Text($r('app.string.transcode_audio_convert_hint')).fontSize(12).fontColor('#667085')
      }
    }.enabled(this.allowEditing).width('100%').padding(16).alignItems(HorizontalAlign.Start)
      .backgroundColor(Color.White).borderRadius(16)
  }
}
