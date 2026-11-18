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

/**
 * ContentEmbed error code mapping table.
 *
 * Error codes are defined in the ContentEmbedKit native header:
 *   interface_sdk_c/zh-cn/ContentEmbedKit/content_embed/content_embed_common.h
 * (ContentEmbed_ErrorCode enum, since 24).
 *
 * Each code maps to a string resource name declared in base/en/zh
 * element/string.json, so failure dialogs follow the app language; the zh
 * wording mirrors the official ContentEmbed_ErrorCode descriptions in the
 * ContentEmbedKit C API reference.
 *
 * When the native side returns a new error code not covered by this table,
 * getCEErrMsg falls back to `Error: ${code}` for troubleshooting without
 * blocking UI.
 */

import { common } from '@kit.AbilityKit';

/**
 * Returns the localized error message for a ContentEmbed error code.
 *
 * Known codes resolve through the context resource manager (per the current
 * app language); unknown codes, a missing context, or a failed resolution
 * fall back to `Error: ${code}`.
 *
 * @param code ContentEmbed_ErrorCode value (see content_embed_common.h)
 * @param context Context used for resource resolution; optional so the
 *                fallback path stays testable without a context
 * @returns The localized message, or `Error: ${code}` as fallback
 */
export function getCEErrMsg(code: number, context?: common.Context): string {
  const resName: string | undefined = CE_ERROR_MAP.get(code);
  if (resName === undefined || context === undefined) {
    return `Error: ${code}`;
  }
  try {
    return context.resourceManager.getStringByNameSync(resName);
  } catch (err) {
    // Keep the dialog usable even when resolution fails; the numeric code
    // in the fallback message is enough for troubleshooting.
    return `Error: ${code}`;
  }
}

/**
 * Returns the string resource name mapped to a ContentEmbed error code.
 *
 * Pure lookup without any context: usable in local unit tests to verify the
 * code-to-resource mapping.
 *
 * @param code ContentEmbed_ErrorCode value (see content_embed_common.h)
 * @returns The resource name (e.g. 'ce_err_msg_401'), or '' for unknown codes
 */
export function getCEErrMsgResName(code: number): string {
  const resName: string | undefined = CE_ERROR_MAP.get(code);
  return resName !== undefined ? resName : '';
}

// Immutable map; uses Map instead of object literal to avoid prototype pollution
// and to make numeric keys more intuitive.
const CE_ERROR_MAP: Map<number, string> = new Map<number, string>([
  // CE_ERR_OK = 0 — operation succeeded (not shown as failure; used for logging/fallback only)
  [0, 'ce_err_msg_0'],

  // CE_PERMISSION_DENIED
  [201, 'ce_err_msg_201'],

  // CE_ERR_PARAM_INVALID
  [401, 'ce_err_msg_401'],

  // CE_ERR_DEVICE_NOT_SUPPORTED
  [801, 'ce_err_msg_801'],

  // CE_ERR_NULL_POINTER
  [35300001, 'ce_err_msg_35300001'],

  // CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED
  [35300002, 'ce_err_msg_35300002'],

  // CE_ERR_EXTENSION_ERROR
  [35300003, 'ce_err_msg_35300003'],

  // CE_ERR_SYSTEM_ABNORMAL
  [35300004, 'ce_err_msg_35300004'],

  // CE_ERR_STORAGE_OPERATION_FAILED
  [35300005, 'ce_err_msg_35300005'],

  // CE_ERR_STREAM_OPERATION_FAILED
  [35300006, 'ce_err_msg_35300006'],

  // CE_ERR_FILE_OPERATION_FAILED
  [35300007, 'ce_err_msg_35300007'],

  // CE_ERR_IN_DLP_SANDBOX
  [35300008, 'ce_err_msg_35300008'],

  // CE_ERR_IMAGE_PACKER_OPERATION_FAILED
  [35300009, 'ce_err_msg_35300009'],

  // CE_ERR_CLIENT_CALLBACK_FAILED
  [35300010, 'ce_err_msg_35300010'],

  // CE_ERR_EXTENSION_ABNORMAL_EXIT
  [35300011, 'ce_err_msg_35300011'],

  // CE_ERR_INVALID_LINKING_PATH
  [35300012, 'ce_err_msg_35300012'],

  // CE_ERR_CONNECT_LIMIT_EXCEED
  [35300013, 'ce_err_msg_35300013'],

  // CE_ERR_FILE_NOT_GRANT
  [35300014, 'ce_err_msg_35300014'],

  // CE_ERR_DISK_FULL
  [35300015, 'ce_err_msg_35300015'],

  // CE_ERR_EXTENSION_NOT_SUPPORT
  [35300016, 'ce_err_msg_35300016'],
]);
