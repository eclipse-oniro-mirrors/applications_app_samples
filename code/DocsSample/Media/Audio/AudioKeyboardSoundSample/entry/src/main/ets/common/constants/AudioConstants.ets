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
export class AudioConstants {
  public static readonly TAG: string = '[Sample_KeyboardSound]';
  public static readonly DOMAIN: number = 0xFF00;

  public static readonly SAMPLE_RATE: number = 44100;
  public static readonly CHANNELS: number = 2;
  public static readonly BYTES_PER_SAMPLE: number = 2;
  public static readonly FRAME_SIZE: number = AudioConstants.BYTES_PER_SAMPLE *
    AudioConstants.CHANNELS;

  public static readonly KEY_SOUND_FREQUENCY: number = 1000;
  public static readonly AMPLITUDE: number = 0.3;
  public static readonly KEY_SOUND_DURATION_MS: number = 150;
  public static readonly KEY_SOUND_DURATION_MS_NOTIFICATION: number = 30;
}
