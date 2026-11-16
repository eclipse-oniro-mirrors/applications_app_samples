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

#include "qos_history.h"

#include <cstdio>
#include <string>
#include <vector>

#include "qos_core.h"
#include "qos_napi_util.h"

namespace {
constexpr int MAX_RECORDS = 200;
constexpr const char* RECORD_FILE_NAME = "qos_history.csv";
constexpr int LEVEL_COUNT = QosCore::LEVEL_COUNT;
constexpr int INVALID_RESULT = QosCore::INVALID_RESULT;
constexpr double INVALID_DURATION = QosCore::INVALID_DURATION;
constexpr int CODE_OK = QosNapi::CODE_OK;
constexpr int CODE_INVALID_ARG = QosNapi::CODE_INVALID_ARG;
constexpr int CODE_IO_ERROR = 402;

struct RunRecord {
    int level = INVALID_RESULT;
    double duration = INVALID_DURATION;
    int setResult = INVALID_RESULT;
    int queryLevel = INVALID_RESULT;
    int resetResult = INVALID_RESULT;
    int bindResult = INVALID_RESULT;
};

std::string BuildRecordPath(const std::string& dirPath)
{
    if (dirPath.empty()) {
        return "";
    }
    if (dirPath.back() == '/') {
        return dirPath + RECORD_FILE_NAME;
    }
    return dirPath + "/" + RECORD_FILE_NAME;
}

bool ParseRecord(const std::string& line, RunRecord* record)
{
    if (record == nullptr || line.empty()) {
        return false;
    }
    int level = 0;
    double duration = 0.0;
    int setResult = 0;
    int queryLevel = 0;
    int resetResult = 0;
    int bindResult = 0;
    int matched = std::sscanf(line.c_str(), "%d,%lf,%d,%d,%d,%d", &level, &duration, &setResult, &queryLevel,
                              &resetResult, &bindResult);
    if (matched != 6) {
        return false;
    }
    if (level < QosCore::MIN_LEVEL || level > QosCore::MAX_LEVEL || duration < 0.0) {
        return false;
    }
    record->level = level;
    record->duration = duration;
    record->setResult = setResult;
    record->queryLevel = queryLevel;
    record->resetResult = resetResult;
    record->bindResult = bindResult;
    return true;
}

std::string FormatRecord(const RunRecord& record)
{
    char buffer[160] = {0};
    int written = std::snprintf(buffer, sizeof(buffer), "%d,%.3f,%d,%d,%d,%d", record.level, record.duration,
                                record.setResult, record.queryLevel, record.resetResult, record.bindResult);
    if (written <= 0) {
        return "";
    }
    return std::string(buffer);
}

std::vector<RunRecord> LoadRecords(const std::string& path)
{
    std::vector<RunRecord> records;
    FILE* file = std::fopen(path.c_str(), "r");
    if (file == nullptr) {
        return records;
    }
    char buffer[256];
    while (std::fgets(buffer, sizeof(buffer), file) != nullptr) {
        std::string line(buffer);
        while (!line.empty() && (line.back() == '\n' || line.back() == '\r')) {
            line.pop_back();
        }
        RunRecord record;
        if (ParseRecord(line, &record)) {
            records.push_back(record);
        }
    }
    std::fclose(file);
    return records;
}

bool SaveRecords(const std::string& path, const std::vector<RunRecord>& records)
{
    FILE* file = std::fopen(path.c_str(), "w");
    if (file == nullptr) {
        return false;
    }
    for (const RunRecord& record : records) {
        std::string line = FormatRecord(record);
        if (line.empty()) {
            continue;
        }
        std::fputs(line.c_str(), file);
        std::fputc('\n', file);
    }
    std::fclose(file);
    return true;
}

void SetRecordFields(napi_env env, napi_value object, const RunRecord& record)
{
    QosNapi::SetNamedInt(env, object, "level", record.level);
    QosNapi::SetNamedDouble(env, object, "duration", record.duration);
    QosNapi::SetNamedInt(env, object, "setResult", record.setResult);
    QosNapi::SetNamedInt(env, object, "queryLevel", record.queryLevel);
    QosNapi::SetNamedInt(env, object, "resetResult", record.resetResult);
    QosNapi::SetNamedInt(env, object, "bindResult", record.bindResult);
}

napi_value BuildEmptyRecordReport(napi_env env)
{
    RunRecord empty;
    napi_value report = nullptr;
    napi_create_object(env, &report);
    QosNapi::SetNamedInt(env, report, "code", CODE_INVALID_ARG);
    SetRecordFields(env, report, empty);
    return report;
}
} // namespace

namespace QosHistory {
napi_value AppendRunRecord(napi_env env, napi_callback_info info)
{
    size_t argc = 7;
    napi_value args[7] = {nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr};
    napi_value report = nullptr;
    napi_create_object(env, &report);

    std::string dirPath;
    RunRecord record;
    bool valid = (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok) && argc >= 7 &&
        QosNapi::ReadStringArg(env, args[0], &dirPath) && QosNapi::ReadIntArg(env, args[1], &record.level) &&
        QosNapi::ReadDoubleArg(env, args[2], &record.duration) &&
        QosNapi::ReadIntArg(env, args[3], &record.setResult) &&
        QosNapi::ReadIntArg(env, args[4], &record.queryLevel) &&
        QosNapi::ReadIntArg(env, args[5], &record.resetResult) &&
        QosNapi::ReadIntArg(env, args[6], &record.bindResult);
    if (valid) {
        valid = record.level >= QosCore::MIN_LEVEL && record.level <= QosCore::MAX_LEVEL && record.duration >= 0.0 &&
            !BuildRecordPath(dirPath).empty();
    }
    if (!valid) {
        QosNapi::SetNamedInt(env, report, "code", CODE_INVALID_ARG);
        QosNapi::SetNamedInt(env, report, "count", 0);
        QosNapi::SetNamedInt(env, report, "capacity", MAX_RECORDS);
        QosNapi::SetNamedInt(env, report, "dropped", 0);
        return report;
    }

    std::string recordPath = BuildRecordPath(dirPath);
    std::vector<RunRecord> records = LoadRecords(recordPath);
    records.push_back(record);
    int dropped = 0;
    if (records.size() > static_cast<size_t>(MAX_RECORDS)) {
        dropped = static_cast<int>(records.size()) - MAX_RECORDS;
        records.erase(records.begin(), records.begin() + dropped);
    }
    if (!SaveRecords(recordPath, records)) {
        QosNapi::SetNamedInt(env, report, "code", CODE_IO_ERROR);
        QosNapi::SetNamedInt(env, report, "count", 0);
        QosNapi::SetNamedInt(env, report, "capacity", MAX_RECORDS);
        QosNapi::SetNamedInt(env, report, "dropped", dropped);
        return report;
    }

    QosNapi::SetNamedInt(env, report, "code", CODE_OK);
    QosNapi::SetNamedInt(env, report, "count", static_cast<int>(records.size()));
    QosNapi::SetNamedInt(env, report, "capacity", MAX_RECORDS);
    QosNapi::SetNamedInt(env, report, "dropped", dropped);
    return report;
}

napi_value ReadRunRecords(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_value report = nullptr;
    napi_create_object(env, &report);

    std::string dirPath;
    int limit = 0;
    bool valid = (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok) && argc >= 2 &&
        QosNapi::ReadStringArg(env, args[0], &dirPath) && QosNapi::ReadIntArg(env, args[1], &limit);
    if (valid) {
        valid = limit >= 1 && limit <= MAX_RECORDS && !BuildRecordPath(dirPath).empty();
    }
    if (!valid) {
        QosNapi::SetNamedInt(env, report, "code", CODE_INVALID_ARG);
        QosNapi::SetNamedInt(env, report, "total", 0);
        QosNapi::SetNamedInt(env, report, "returned", 0);
        napi_value empty = nullptr;
        napi_create_array_with_length(env, 0, &empty);
        napi_set_named_property(env, report, "records", empty);
        return report;
    }

    std::vector<RunRecord> records = LoadRecords(BuildRecordPath(dirPath));
    int total = static_cast<int>(records.size());
    int start = (total > limit) ? (total - limit) : 0;
    int returned = total - start;

    napi_value list = nullptr;
    napi_create_array_with_length(env, static_cast<size_t>(returned), &list);
    for (int index = start; index < total; index++) {
        const RunRecord& record = records[static_cast<size_t>(index)];
        napi_value item = nullptr;
        napi_create_object(env, &item);
        QosNapi::SetNamedInt(env, item, "index", index);
        SetRecordFields(env, item, record);
        napi_set_element(env, list, static_cast<uint32_t>(index - start), item);
    }

    QosNapi::SetNamedInt(env, report, "code", CODE_OK);
    QosNapi::SetNamedInt(env, report, "total", total);
    QosNapi::SetNamedInt(env, report, "returned", returned);
    napi_set_named_property(env, report, "records", list);
    return report;
}

napi_value ClearRunRecords(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value report = nullptr;
    napi_create_object(env, &report);

    std::string dirPath;
    bool valid = (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok) && argc >= 1 &&
        QosNapi::ReadStringArg(env, args[0], &dirPath);
    if (valid) {
        valid = !BuildRecordPath(dirPath).empty();
    }
    if (!valid) {
        QosNapi::SetNamedInt(env, report, "code", CODE_INVALID_ARG);
        QosNapi::SetNamedInt(env, report, "removed", 0);
        return report;
    }

    std::string recordPath = BuildRecordPath(dirPath);
    int removed = static_cast<int>(LoadRecords(recordPath).size());
    std::remove(recordPath.c_str());
    QosNapi::SetNamedInt(env, report, "code", CODE_OK);
    QosNapi::SetNamedInt(env, report, "removed", removed);
    return report;
}

napi_value GetRecordStats(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value report = nullptr;
    napi_create_object(env, &report);

    std::string dirPath;
    bool valid = (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok) && argc >= 1 &&
        QosNapi::ReadStringArg(env, args[0], &dirPath);
    if (valid) {
        valid = !BuildRecordPath(dirPath).empty();
    }
    if (!valid) {
        QosNapi::SetNamedInt(env, report, "code", CODE_INVALID_ARG);
        QosNapi::SetNamedInt(env, report, "total", 0);
        QosNapi::SetNamedInt(env, report, "successCount", 0);
        QosNapi::SetNamedInt(env, report, "failureCount", 0);
        QosNapi::SetNamedDouble(env, report, "avgDuration", INVALID_DURATION);
        QosNapi::SetNamedDouble(env, report, "minDuration", INVALID_DURATION);
        QosNapi::SetNamedDouble(env, report, "maxDuration", INVALID_DURATION);
        napi_value empty = nullptr;
        napi_create_array_with_length(env, LEVEL_COUNT, &empty);
        napi_set_named_property(env, report, "levelCounts", empty);
        return report;
    }

    std::vector<RunRecord> records = LoadRecords(BuildRecordPath(dirPath));
    int successCount = 0;
    int failureCount = 0;
    int levelCounts[LEVEL_COUNT] = {0, 0, 0, 0, 0, 0};
    double totalDuration = 0.0;
    double minDuration = INVALID_DURATION;
    double maxDuration = INVALID_DURATION;
    for (const RunRecord& record : records) {
        if (record.level >= QosCore::MIN_LEVEL && record.level <= QosCore::MAX_LEVEL) {
            levelCounts[record.level - QosCore::MIN_LEVEL]++;
        }
        if (record.setResult != 0) {
            failureCount++;
            continue;
        }
        successCount++;
        totalDuration += record.duration;
        if (minDuration < 0.0 || record.duration < minDuration) {
            minDuration = record.duration;
        }
        if (maxDuration < 0.0 || record.duration > maxDuration) {
            maxDuration = record.duration;
        }
    }

    QosNapi::SetNamedInt(env, report, "code", CODE_OK);
    QosNapi::SetNamedInt(env, report, "total", static_cast<int>(records.size()));
    QosNapi::SetNamedInt(env, report, "successCount", successCount);
    QosNapi::SetNamedInt(env, report, "failureCount", failureCount);
    QosNapi::SetNamedDouble(env, report, "avgDuration",
                            (successCount > 0) ? (totalDuration / successCount) : INVALID_DURATION);
    QosNapi::SetNamedDouble(env, report, "minDuration", minDuration);
    QosNapi::SetNamedDouble(env, report, "maxDuration", maxDuration);

    napi_value counts = nullptr;
    napi_create_array_with_length(env, LEVEL_COUNT, &counts);
    for (int index = 0; index < LEVEL_COUNT; index++) {
        napi_set_element(env, counts, static_cast<uint32_t>(index), QosNapi::CreateInt(env, levelCounts[index]));
    }
    napi_set_named_property(env, report, "levelCounts", counts);
    return report;
}

napi_value ParseRunRecordLine(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    std::string text;
    RunRecord record;
    bool valid = (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok) && argc >= 1 &&
        QosNapi::ReadStringArg(env, args[0], &text) && ParseRecord(text, &record);
    if (!valid) {
        return BuildEmptyRecordReport(env);
    }

    napi_value report = nullptr;
    napi_create_object(env, &report);
    QosNapi::SetNamedInt(env, report, "code", CODE_OK);
    SetRecordFields(env, report, record);
    return report;
}
} // namespace QosHistory
