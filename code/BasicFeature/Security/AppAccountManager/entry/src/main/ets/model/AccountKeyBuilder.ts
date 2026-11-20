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
 * 应用账号名称、凭据类型、关联数据的键拼装规则。
 *
 * 同一个用户在三个示例应用（Music / Video / Map）下拥有互相独立的账号，
 * 因此所有键都带应用名后缀。
 */
export class AccountKeyBuilder {
    /**
     * 邮箱凭据类型前缀。
     */
    public static readonly EMAIL_FIELD: string = 'email';
    /**
     * 个性签名凭据类型前缀。
     */
    public static readonly SIGNATURE_FIELD: string = 'signature';
    /**
     * 关联数据键前缀。
     */
    public static readonly ASSOCIATED_KEY_PREFIX: string = 'key';
    /**
     * 登录标记的取值。
     */
    public static readonly LOGIN_FLAG: string = 'true';

    /**
     * 拼装应用账号名，形如 `tom_Music`。
     *
     * @param username 用户名
     * @param bundleName 示例应用名
     * @returns 账号名
     */
    public static accountName(username: string, bundleName: string): string {
        return `${username}_${bundleName}`;
    }

    /**
     * 拼装凭据类型，形如 `email_Music`、`signature_Music`。
     *
     * @param field 字段前缀
     * @param bundleName 示例应用名
     * @returns 凭据类型
     */
    public static credentialType(field: string, bundleName: string): string {
        return `${field}_${bundleName}`;
    }

    /**
     * 拼装关联数据键，形如 `key_Music`。
     *
     * @param bundleName 示例应用名
     * @returns 关联数据键
     */
    public static associatedKey(bundleName: string): string {
        return `${AccountKeyBuilder.ASSOCIATED_KEY_PREFIX}_${bundleName}`;
    }
}
