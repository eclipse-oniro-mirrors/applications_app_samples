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

/**
 * Application-wide constants shared by every module of the sample.
 * All values are immutable so they can be referenced safely from any layer.
 */
export class AppConstants {
  /** HiLog domain and tag used by AppLogger for all runtime log output. */
  public static readonly LOG_DOMAIN: number = 0xFF00;
  public static readonly LOG_TAG: string = '[Sample_MeetingScene]';

  /** Relational store database file name and schema version. */
  public static readonly DB_NAME: string = 'meeting_scene.db';
  public static readonly DB_VERSION: number = 1;

  /** Scene run scheduling intervals in milliseconds (frame tick and step pacing). */
  public static readonly FRAME_INTERVAL_MS: number = 100;
  public static readonly STEP_INTERVAL_MS: number = 250;
  public static readonly MIN_STEP_INTERVAL_MS: number = 0;
  public static readonly MAX_STEP_INTERVAL_MS: number = 5000;

  /** Raw IR pattern limits and the default carrier frequency for compiled codes. */
  public static readonly MAX_PATTERN_LENGTH: number = 1024;
  public static readonly DEFAULT_FREQUENCY_HZ: number = 38000;

  /** Capacity limits enforced by scene and room validation. */
  public static readonly MAX_SCENE_STEPS: number = 12;
  public static readonly MAX_DEVICES_PER_ROOM: number = 20;

  /** Configuration package compatibility version and send-log retention policy. */
  public static readonly CONFIG_PACKAGE_VERSION: number = 1;
  public static readonly SEND_LOG_RETAIN_DAYS: number = 30;
  public static readonly SEND_LOG_RETAIN_COUNT: number = 1000;

  /** Default room identifier and the preference flag guarding one-time seeding. */
  public static readonly DEFAULT_ROOM_ID: string = 'room-default';
  public static readonly DEFAULT_SEED_FLAG: string = 'default_config_seeded';
}
