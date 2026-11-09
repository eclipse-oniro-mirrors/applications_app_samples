#!/usr/bin/env bash
# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Fetch the third-party nlohmann/json single header during the build stage.
# The generated header is not tracked by Git (see .gitignore).

set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
JSON_REPO_URL="${JSON_REPO_URL:-https://gitcode.com/GitHub_Trending/js/json.git}"
JSON_REPO_TAG="${JSON_REPO_TAG:-v3.11.3}"
TARGET_DIR="${SCRIPT_DIR}/entry/src/main/cpp/include/nlohmann"
TARGET_FILE="${TARGET_DIR}/json.hpp"
LOCK_DIR="${TARGET_DIR}/.prepare.lock"

if [ -f "${TARGET_FILE}" ]; then
    echo "[prepare_opensource_deps] ${TARGET_FILE} already exists, skip."
    exit 0
fi

if ! command -v git >/dev/null 2>&1; then
    echo "[prepare_opensource_deps] ERROR: git is required to fetch nlohmann/json." >&2
    exit 1
fi

mkdir -p "${TARGET_DIR}"

TMP_DIR=""
LOCK_HELD=0
cleanup() {
    if [ -n "${TMP_DIR}" ] && [ -d "${TMP_DIR}" ]; then
        rm -rf "${TMP_DIR}"
    fi
    if [ "${LOCK_HELD}" -eq 1 ]; then
        rmdir "${LOCK_DIR}" 2>/dev/null || true
    fi
}
trap cleanup EXIT INT TERM

# Serialize parallel builds (e.g. one per ABI) so only one process clones.
WAIT_COUNT=0
while [ "${LOCK_HELD}" -eq 0 ]; do
    if mkdir "${LOCK_DIR}" 2>/dev/null; then
        LOCK_HELD=1
    elif [ -f "${TARGET_FILE}" ]; then
        echo "[prepare_opensource_deps] ${TARGET_FILE} already exists, skip."
        exit 0
    elif [ "${WAIT_COUNT}" -ge 120 ]; then
        echo "[prepare_opensource_deps] ERROR: timed out waiting for ${LOCK_DIR}." >&2
        exit 1
    else
        WAIT_COUNT=$((WAIT_COUNT + 1))
        sleep 1
    fi
done

if [ -f "${TARGET_FILE}" ]; then
    echo "[prepare_opensource_deps] ${TARGET_FILE} already exists, skip."
    exit 0
fi

TMP_DIR=$(mktemp -d)

CLONE_OK=0
for ATTEMPT in 1 2 3; do
    rm -rf "${TMP_DIR}/json"
    echo "[prepare_opensource_deps] Cloning ${JSON_REPO_URL} (${JSON_REPO_TAG}), attempt ${ATTEMPT} ..."
    if git clone --depth 1 --branch "${JSON_REPO_TAG}" "${JSON_REPO_URL}" "${TMP_DIR}/json"; then
        CLONE_OK=1
        break
    fi
    sleep 2
done
if [ "${CLONE_OK}" -ne 1 ]; then
    echo "[prepare_opensource_deps] ERROR: failed to clone ${JSON_REPO_URL}." >&2
    exit 1
fi

cp "${TMP_DIR}/json/single_include/nlohmann/json.hpp" "${TARGET_FILE}.tmp.$$"
mv -f "${TARGET_FILE}.tmp.$$" "${TARGET_FILE}"
echo "[prepare_opensource_deps] nlohmann/json header copied to ${TARGET_FILE}"
