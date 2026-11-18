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

#include "napi/native_api.h"
#include <atomic>
#include <cerrno>
#include <cstdint>
#include <cstring>
#include <ctime>
#include <fcntl.h>
#include <exception>
#include <mutex>
#include <new>
#include <sys/resource.h>
#include <string>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <sys/utsname.h>
#include <unistd.h>
#include <vector>

namespace {
constexpr int64_t MAX_FILE_BYTES = 128LL * 1024 * 1024;
constexpr int64_t CALIBRATION_BYTES = 8LL * 1024 * 1024;
constexpr int64_t MILLISECONDS_PER_SECOND = 1000;
constexpr int64_t NANOSECONDS_PER_MILLISECOND = 1000000;
constexpr size_t MAX_PATH_BYTES = 4096;
constexpr size_t IO_BUFFER_BYTES = 65536;
constexpr uint32_t CHECKSUM_OFFSET_BASIS = 2166136261U;
constexpr uint32_t CHECKSUM_PRIME = 16777619U;
constexpr unsigned char CALIBRATION_FILL_BYTE = 0x5a;
constexpr mode_t PRIVATE_FILE_MODE = 0600;
constexpr uint64_t HEX_RADIX = 16;
constexpr char HEX_DIGITS[] = "0123456789abcdef";
constexpr uint64_t PAGEMAP_PRESENT_MASK = 1ULL << 63;
constexpr unsigned char RESIDENT_PAGE_MASK = 1U;

struct Probe {
    bool ok = false; // Operation/syscall success, NOT proof that residency is observable.
    bool residencyTrusted = false; // Conservative eligibility; same-run calibration is also required.
    std::string residencyTrustReason = "not-sampled";
    std::string operation;
    int errorCode = 0;
    std::string message;
    int cleanupErrorCode = 0; // Secondary cleanup failure never overwrites a primary sample error.
    int64_t fileBytes = 0;
    int64_t pageBytes = 0;
    int64_t totalPages = 0;
    int64_t residentPages = 0; // Raw mincore vector count, even when untrusted.
    int64_t residentBytes = 0; // File CONTENT bytes covered by reported resident pages, not allocation.
    int64_t bytesRead = 0;
    uint32_t checksum = CHECKSUM_OFFSET_BASIS;
    std::string inode; // Legacy combined device:inode identifier.
    std::string deviceId;
    unsigned deviceMajor = 0;
    unsigned deviceMinor = 0;
    std::string inodeNumber; // Decimal strings avoid JS integer precision loss.
    std::string inodeHex;
    uid_t fileOwnerUid = 0;
    uid_t processUid = geteuid(); // Legacy field: effective UID.
    uid_t realUid = getuid();
    bool ownsFile = false;
    bool writeOpenAllowed = false;
    int writeOpenErrno = 0;
    bool ownerOrWritable = false; // Legacy compatibility, now uses an actual effective-UID open.
    int64_t sampleStartedMonotonicMs = 0;
    int64_t sampleCompletedMonotonicMs = 0;
    int64_t sampleWallTimeMs = 0;
    std::string kernelName;
    std::string kernelRelease;
};

struct Calibration {
    bool ok = false;
    bool passed = false;
    std::string path;
    std::string phase = "validate-private-directory";
    int errorCode = 0;
    std::string message;
    int64_t bytesWritten = 0;
    int fsyncReturnCode = -1;
    int fadviseReturnCode = -1;
    bool removed = false;
    int cleanupErrorCode = 0;
    Probe afterWrite;
    Probe afterDrop;
    Probe afterRead;
};

int64_t ClockMs(clockid_t id)
{
    struct timespec value {};
    return clock_gettime(id, &value) == 0 ?
        value.tv_sec * MILLISECONDS_PER_SECOND + value.tv_nsec / NANOSECONDS_PER_MILLISECOND : 0;
}

// Never overwrite a pending JavaScript exception with a secondary native error.
bool NapiOk(napi_env env, napi_status status)
{
    if (status == napi_ok) {
        return true;
    }
    bool pending = false;
    if (napi_is_exception_pending(env, &pending) != napi_ok || pending) {
        return false;
    }
    const napi_status thrown = napi_throw_error(env, nullptr, "pageprobe N-API operation failed");
    if (thrown != napi_ok) {
        return false;
    }
    return false;
}

napi_value ThrowError(napi_env env, const char *message)
{
    bool pending = false;
    if (napi_is_exception_pending(env, &pending) != napi_ok || pending) {
        return nullptr;
    }
    const napi_status thrown = napi_throw_error(env, nullptr, message);
    if (thrown != napi_ok) {
        return nullptr;
    }
    return nullptr;
}

bool Property(napi_env env, napi_value object, const char *key, napi_value value)
{
    return object != nullptr && value != nullptr && NapiOk(env, napi_set_named_property(env, object, key, value));
}

bool Number(napi_env env, napi_value object, const char *key, double number)
{
    napi_value value = nullptr;
    return NapiOk(env, napi_create_double(env, number, &value)) && Property(env, object, key, value);
}

bool Text(napi_env env, napi_value object, const char *key, const std::string &text)
{
    napi_value value = nullptr;
    return NapiOk(env, napi_create_string_utf8(env, text.c_str(), text.size(), &value)) &&
        Property(env, object, key, value);
}

bool Boolean(napi_env env, napi_value object, const char *key, bool flag)
{
    napi_value value = nullptr;
    return NapiOk(env, napi_get_boolean(env, flag, &value)) && Property(env, object, key, value);
}

// A descriptor is consumed exactly once. In particular, close(EINTR) is not retried:
// the descriptor may already have been closed and reused by another thread.
class ScopedFd {
public:
    explicit ScopedFd(int fd) : fd_(fd) {}
    ~ScopedFd()
    {
        if (fd_ >= 0) {
            close(fd_);
        }
    }
    ScopedFd(const ScopedFd &) = delete;
    ScopedFd &operator=(const ScopedFd &) = delete;
    int Get() const { return fd_; }
    int Take()
    {
        const int fd = fd_;
        fd_ = -1;
        return fd;
    }
private:
    int fd_ = -1;
};

bool SerializeProbeStatus(napi_env env, napi_value object, const Probe &probe)
{
    if (!Boolean(env, object, "ok", probe.ok)) { return false; }
    if (!Boolean(env, object, "residencyTrusted", probe.residencyTrusted)) { return false; }
    if (!Text(env, object, "residencyTrustReason", probe.residencyTrustReason)) { return false; }
    if (!Text(env, object, "operation", probe.operation)) { return false; }
    if (!Number(env, object, "errorCode", probe.errorCode)) { return false; }
    if (!Number(env, object, "cleanupErrorCode", probe.cleanupErrorCode)) { return false; }
    if (!Text(env, object, "message", probe.message)) { return false; }
    return true;
}

bool SerializeProbeLayout(napi_env env, napi_value object, const Probe &probe)
{
    if (!Number(env, object, "fileBytes", probe.fileBytes)) { return false; }
    if (!Number(env, object, "pageBytes", probe.pageBytes)) { return false; }
    if (!Number(env, object, "totalPages", probe.totalPages)) { return false; }
    if (!Number(env, object, "residentPages", probe.residentPages)) { return false; }
    if (!Number(env, object, "residentBytes", probe.residentBytes)) { return false; }
    if (!Number(env, object, "residentContentBytes", probe.residentBytes)) { return false; }
    if (!Text(env, object, "residentBytesMeaning",
        "file content bytes covered by raw reported resident pages; not physical allocation or reclaimed bytes")) {
        return false;
    }
    if (!Number(env, object, "bytesRead", probe.bytesRead)) { return false; }
    if (!Number(env, object, "checksum", probe.checksum)) { return false; }
    return true;
}

bool SerializeProbeIdentity(napi_env env, napi_value object, const Probe &probe)
{
    if (!Text(env, object, "inode", probe.inode)) { return false; }
    if (!Text(env, object, "deviceId", probe.deviceId)) { return false; }
    if (!Number(env, object, "deviceMajor", probe.deviceMajor)) { return false; }
    if (!Number(env, object, "deviceMinor", probe.deviceMinor)) { return false; }
    if (!Text(env, object, "inodeNumber", probe.inodeNumber)) { return false; }
    if (!Text(env, object, "inodeHex", probe.inodeHex)) { return false; }
    if (!Number(env, object, "fileOwnerUid", probe.fileOwnerUid)) { return false; }
    if (!Number(env, object, "processUid", probe.processUid)) { return false; }
    if (!Number(env, object, "realUid", probe.realUid)) { return false; }
    if (!Boolean(env, object, "ownsFile", probe.ownsFile)) { return false; }
    if (!Boolean(env, object, "writeOpenAllowed", probe.writeOpenAllowed)) { return false; }
    if (!Number(env, object, "writeOpenErrno", probe.writeOpenErrno)) { return false; }
    if (!Boolean(env, object, "ownerOrWritable", probe.ownerOrWritable)) { return false; }
    return true;
}

bool SerializeProbeTimeKernel(napi_env env, napi_value object, const Probe &probe)
{
    if (!Number(env, object, "sampleStartedMonotonicMs", probe.sampleStartedMonotonicMs)) { return false; }
    if (!Number(env, object, "sampleCompletedMonotonicMs", probe.sampleCompletedMonotonicMs)) { return false; }
    if (!Number(env, object, "sampleWallTimeMs", probe.sampleWallTimeMs)) { return false; }
    if (!Text(env, object, "kernelName", probe.kernelName)) { return false; }
    if (!Text(env, object, "kernelRelease", probe.kernelRelease)) { return false; }
    return true;
}

napi_value Result(napi_env env, const Probe &probe)
{
    napi_value object = nullptr;
    if (!NapiOk(env, napi_create_object(env, &object))) {
        return nullptr;
    }
    if (!SerializeProbeStatus(env, object, probe)) {
        return nullptr;
    }
    if (!SerializeProbeLayout(env, object, probe)) {
        return nullptr;
    }
    if (!SerializeProbeIdentity(env, object, probe)) {
        return nullptr;
    }
    if (!SerializeProbeTimeKernel(env, object, probe)) {
        return nullptr;
    }
    return object;
}

void Fail(Probe &probe, const char *operation)
{
    const int errorCode = errno;
    probe.errorCode = errorCode;
    probe.operation = operation;
    probe.message = std::string(operation) + ": " + std::strerror(errorCode);
}

enum class PathArgument { VALID, INVALID, NAPI_FAILURE };

PathArgument ArgumentPath(napi_env env, napi_callback_info info, std::string &path)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    if (!NapiOk(env, napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr))) {
        return PathArgument::NAPI_FAILURE;
    }
    if (argc != 1) { return PathArgument::INVALID; }
    napi_valuetype type = napi_undefined;
    if (!NapiOk(env, napi_typeof(env, argv[0], &type))) { return PathArgument::NAPI_FAILURE; }
    if (type != napi_string) { return PathArgument::INVALID; }
    size_t length = 0;
    if (!NapiOk(env, napi_get_value_string_utf8(env, argv[0], nullptr, 0, &length))) {
        return PathArgument::NAPI_FAILURE;
    }
    if (length == 0 || length > MAX_PATH_BYTES) { return PathArgument::INVALID; }
    std::vector<char> buffer(length + 1);
    if (!NapiOk(env, napi_get_value_string_utf8(env, argv[0], buffer.data(), buffer.size(), &length))) {
        return PathArgument::NAPI_FAILURE;
    }
    path.assign(buffer.data(), length);
    return path.find('\0') == std::string::npos ? PathArgument::VALID : PathArgument::INVALID;
}

std::string UnsignedHex(uint64_t value)
{
    std::string text;
    do {
        text.insert(text.begin(), HEX_DIGITS[value % HEX_RADIX]);
        value /= HEX_RADIX;
    } while (value != 0);
    return text;
}

bool Metadata(int fd, Probe &probe)
{
    struct stat st {};
    if (fstat(fd, &st) != 0) {
        Fail(probe, "fstat");
        return false;
    }
    probe.fileBytes = st.st_size;
    probe.pageBytes = sysconf(_SC_PAGESIZE);
    probe.fileOwnerUid = st.st_uid;
    probe.deviceId = std::to_string(st.st_dev);
    probe.deviceMajor = major(st.st_dev);
    probe.deviceMinor = minor(st.st_dev);
    probe.inodeNumber = std::to_string(st.st_ino);
    probe.inodeHex = UnsignedHex(static_cast<unsigned long long>(st.st_ino));
    probe.inode = probe.deviceId + ":" + probe.inodeNumber;
    probe.ownsFile = st.st_uid == geteuid();
    struct utsname system {};
    if (uname(&system) == 0) {
        probe.kernelName = system.sysname;
        probe.kernelRelease = system.release;
    }
    if (!S_ISREG(st.st_mode) || st.st_size <= 0 || st.st_size > MAX_FILE_BYTES || probe.pageBytes <= 0) {
        errno = EINVAL;
        Fail(probe, "regular-file-size-or-page-size");
        return false;
    }
    probe.totalPages = (probe.fileBytes + probe.pageBytes - 1) / probe.pageBytes;
    return true;
}

void PermissionSignal(int fd, const std::string &path, Probe &probe)
{
    // This tests effective write OPEN access, without O_TRUNC or any write to the target.
    // It is NOT a claim about the exact mincore permission gate of a particular kernel.
    ScopedFd writableOwner(open(path.c_str(), O_WRONLY | O_CLOEXEC));
    const int writable = writableOwner.Get();
    if (writable < 0) {
        probe.writeOpenErrno = errno;
    } else {
        struct stat original {};
        struct stat candidate {};
        if (fstat(fd, &original) != 0 || fstat(writable, &candidate) != 0) {
            probe.writeOpenErrno = errno;
        } else if (original.st_dev != candidate.st_dev || original.st_ino != candidate.st_ino) {
            probe.writeOpenErrno = ESTALE;
        } else {
            probe.writeOpenAllowed = true;
        }
    }
    probe.ownerOrWritable = probe.ownsFile || probe.writeOpenAllowed;
}

bool ReadAll(int fd, Probe &probe)
{
    std::vector<unsigned char> buffer(IO_BUFFER_BYTES);
    while (probe.bytesRead < probe.fileBytes) {
        const int64_t remaining = probe.fileBytes - probe.bytesRead;
        const size_t requested = remaining < static_cast<int64_t>(buffer.size()) ?
            static_cast<size_t>(remaining) : buffer.size();
        const ssize_t count = pread(fd, buffer.data(), requested, probe.bytesRead);
        if (count < 0 && errno == EINTR) {
            continue;
        }
        if (count <= 0) {
            if (count == 0) {
                errno = EIO;
            }
            Fail(probe, "pread");
            return false;
        }
        for (ssize_t index = 0; index < count; ++index) {
            probe.checksum = (probe.checksum ^ buffer[index]) * CHECKSUM_PRIME;
        }
        probe.bytesRead += count;
    }
    return true;
}

void CountResidentPages(const std::vector<unsigned char> &resident, Probe &probe)
{
    for (int64_t index = 0; index < probe.totalPages; ++index) {
        if (resident[index] & RESIDENT_PAGE_MASK) {
            ++probe.residentPages;
            const int64_t remaining = probe.fileBytes - index * probe.pageBytes;
            probe.residentBytes += remaining < probe.pageBytes ? remaining : probe.pageBytes;
        }
    }
}

// Each N-API environment owns its own mapping. Handles from a worker cannot
// operate on another environment's mapping; only handle allocation is process-wide.
struct HeldMapping {
    int fd = -1;
    void *address = MAP_FAILED;
    size_t length = 0;
    uint32_t handle = 0;
    bool pagemapEstablished = false;
    bool unreported = false; // A failed begin serialization has not returned a handle to JavaScript.
    Probe identity;

    HeldMapping() = default;
    HeldMapping(const HeldMapping &) = delete;
    HeldMapping &operator=(const HeldMapping &) = delete;
    ~HeldMapping()
    {
        int ignored = 0;
        Release(ignored);
    }

    bool Release(int &errorCode)
    {
        if (address != MAP_FAILED && munmap(address, length) != 0) {
            errorCode = errno;
            return false; // Keep address, length, fd and handle for a later cleanup attempt.
        }
        address = MAP_FAILED;
        length = 0;
        handle = 0;
        pagemapEstablished = false;
        unreported = false;
        const int owned = fd;
        fd = -1; // Consume before close; do not retry an ambiguous close(EINTR).
        if (owned >= 0 && close(owned) != 0) {
            errorCode = errno;
            return false;
        }
        return true;
    }
};

struct EnvironmentState {
    HeldMapping held;
    EnvironmentState *nextRetired = nullptr;
};
std::atomic<uint32_t> g_nextMappingHandle {0};
std::mutex g_retiredMutex;
EnvironmentState *g_retired = nullptr;

// If a teardown munmap fails, retain its native ownership outside the dead env.
// Later env initialization/teardown retries only these orphan resources under a
// mutex. There are no napi_env/napi_value references and no cross-worker live access.
void RetryRetiredMappings()
{
    std::lock_guard<std::mutex> lock(g_retiredMutex);
    EnvironmentState **link = &g_retired;
    while (*link != nullptr) {
        EnvironmentState *state = *link;
        int cleanupError = 0;
        state->held.Release(cleanupError);
        if (state->held.address == MAP_FAILED) {
            *link = state->nextRetired;
            delete state;
        } else {
            link = &state->nextRetired;
        }
    }
}

void CleanupEnvironment(void *data)
{
    auto *state = static_cast<EnvironmentState *>(data);
    int cleanupError = 0;
    state->held.Release(cleanupError);
    if (state->held.address == MAP_FAILED) {
        delete state;
    } else {
        std::lock_guard<std::mutex> lock(g_retiredMutex);
        state->nextRetired = g_retired;
        g_retired = state;
    }
    RetryRetiredMappings();
}

EnvironmentState *CallbackState(napi_env env, napi_callback_info info)
{
    size_t argc = 0;
    void *data = nullptr;
    if (!NapiOk(env, napi_get_cb_info(env, info, &argc, nullptr, nullptr, &data))) {
        return nullptr;
    }
    if (data == nullptr) {
        ThrowError(env, "pageprobe environment state is unavailable");
        return nullptr;
    }
    return static_cast<EnvironmentState *>(data);
}

class StateCleanupGuard {
public:
    explicit StateCleanupGuard(EnvironmentState *state) : state_(state) {}
    ~StateCleanupGuard() { CleanupEnvironment(state_); }
    StateCleanupGuard(const StateCleanupGuard &) = delete;
    StateCleanupGuard &operator=(const StateCleanupGuard &) = delete;
private:
    EnvironmentState *state_;
};

void SampleFd(int fd, Probe &probe)
{
    // No read/fault of the temporary PROT_NONE mapping. Clock boundaries enclose the raw sample.
    probe.sampleStartedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
    probe.sampleWallTimeMs = ClockMs(CLOCK_REALTIME);
    auto *mappingState = new (std::nothrow) EnvironmentState();
    if (mappingState == nullptr) {
        errno = ENOMEM;
        Fail(probe, "allocate-mapping-owner");
        return;
    }
    StateCleanupGuard mappingOwner(mappingState);
    HeldMapping &region = mappingState->held;
    region.length = static_cast<size_t>(probe.fileBytes);
    region.address = mmap(nullptr, probe.fileBytes, PROT_NONE, MAP_SHARED, fd, 0);
    void *mapping = region.address;
    if (mapping == MAP_FAILED) {
        Fail(probe, "mmap");
    } else {
        std::vector<unsigned char> resident(static_cast<size_t>(probe.totalPages));
        if (mincore(mapping, probe.fileBytes, resident.data()) != 0) {
            Fail(probe, "mincore");
        } else {
            CountResidentPages(resident, probe);
            probe.ok = true;
            probe.residencyTrusted = probe.ownerOrWritable;
            probe.residencyTrustReason = probe.residencyTrusted ?
                "conservative-owner-or-effective-write-open; same-run calibration also required; "
                "kernel gate not proven" :
                "no-owner-or-effective-write-open; residency unobserved, not zero eviction; kernel gate unknown";
            probe.message = "Raw file-page residency vector; not process RSS or API reclaimed quantity";
        }
        int cleanupError = 0;
        if (!region.Release(cleanupError)) {
            probe.ok = false;
            probe.residencyTrusted = false;
            probe.cleanupErrorCode = cleanupError;
            if (probe.errorCode == 0) {
                errno = cleanupError;
                Fail(probe, "munmap-sample");
            }
        }
    }
    probe.sampleCompletedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
}

Probe ProbePath(const std::string &path, bool warm)
{
    Probe probe;
    probe.operation = warm ? "pread-all-bytes+mincore" : "mincore";
    ScopedFd fdOwner(open(path.c_str(), O_RDONLY | O_CLOEXEC));
    const int fd = fdOwner.Get();
    if (fd < 0) {
        Fail(probe, "open-read");
        return probe;
    }
    if (Metadata(fd, probe)) {
        PermissionSignal(fd, path, probe);
        if (!warm || ReadAll(fd, probe)) {
            SampleFd(fd, probe);
        }
    }
    return probe;
}

napi_value Measure(napi_env env, napi_callback_info info, bool warm)
{
    std::string path;
    const PathArgument argument = ArgumentPath(env, info, path);
    if (argument == PathArgument::NAPI_FAILURE) { return nullptr; }
    if (argument == PathArgument::INVALID) {
        Probe probe;
        probe.operation = "argument";
        probe.errorCode = EINVAL;
        probe.message = "Expected one nonempty path without embedded NUL";
        return Result(env, probe);
    }
    return Result(env, ProbePath(path, warm));
}

Probe CalibrationSample(int fd, bool warm)
{
    Probe probe;
    probe.operation = warm ? "calibration-pread+mincore" : "calibration-mincore";
    if (Metadata(fd, probe)) {
        probe.writeOpenAllowed = true; // This very fd was created O_RDWR, not an access() guess.
        probe.ownerOrWritable = probe.ownsFile || probe.writeOpenAllowed;
        if (!warm || ReadAll(fd, probe)) {
            SampleFd(fd, probe);
        }
    }
    return probe;
}

bool ValidateCalibrationDirectory(int dir, Calibration &result)
{
    struct stat directoryStat {};
    if (fstat(dir, &directoryStat) != 0) {
        result.phase = "fstat-private-directory";
        result.errorCode = errno;
        result.message = std::strerror(errno);
        return false;
    }
    if (directoryStat.st_uid != geteuid() || (directoryStat.st_mode & S_IWOTH) != 0) {
        result.errorCode = EACCES;
        result.message = "Calibration requires an app-owned non-world-writable private directory";
        return false;
    }
    return true;
}

std::string CalibrationName()
{
    static std::atomic<uint64_t> serial {0};
    return ".pageprobe-calibration-" + std::to_string(getpid()) + "-" +
        std::to_string(ClockMs(CLOCK_MONOTONIC)) + "-" + std::to_string(++serial) + ".bin";
}

void WriteCalibrationFile(int fd, bool identified, const std::vector<unsigned char> &buffer, Calibration &result)
{
    if (identified) {
        result.phase = "write-new-private-file";
    }
    while (identified && result.bytesWritten < CALIBRATION_BYTES) {
        const int64_t remaining = CALIBRATION_BYTES - result.bytesWritten;
        const size_t requested = remaining < static_cast<int64_t>(buffer.size()) ?
            static_cast<size_t>(remaining) : buffer.size();
        const ssize_t count = write(fd, buffer.data(), requested);
        if (count < 0 && errno == EINTR) {
            continue;
        }
        if (count <= 0) {
            result.errorCode = count == 0 ? EIO : errno;
            break;
        }
        result.bytesWritten += count;
    }
}

bool CalibrationPassed(const Calibration &result)
{
    return result.ok && result.afterWrite.residencyTrusted && result.afterDrop.residencyTrusted &&
        result.afterRead.residencyTrusted && result.afterRead.bytesRead == CALIBRATION_BYTES &&
        result.afterWrite.residentPages == result.afterWrite.totalPages &&
        result.afterDrop.residentPages < result.afterWrite.residentPages &&
        result.afterRead.residentPages == result.afterRead.totalPages;
}

void CompleteCalibration(int fd, Calibration &result)
{
    if (result.errorCode == 0) {
        result.phase = "fsync-new-private-file";
        result.fsyncReturnCode = fsync(fd);
        if (result.fsyncReturnCode != 0) {
            result.errorCode = errno;
        }
    }
    if (result.errorCode == 0) {
        result.afterWrite = CalibrationSample(fd, false);
        result.phase = "fadvise-ONLY-new-private-file";
        result.fadviseReturnCode = posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
        // posix_fadvise returns its error code directly, not via errno.
        if (result.fadviseReturnCode != 0) {
            result.errorCode = result.fadviseReturnCode;
        }
        result.afterDrop = CalibrationSample(fd, false);
        result.afterRead = CalibrationSample(fd, true);
        result.ok = result.errorCode == 0 && result.afterWrite.ok && result.afterDrop.ok && result.afterRead.ok;
        result.passed = CalibrationPassed(result);
        result.message = result.passed ? "Cold/warm responsiveness observed ONLY on this new private inode" :
            "Private-file calibration not established; no inference of HAP observability or zero reclamation";
        result.phase = "completed";
    } else {
        result.message = std::strerror(result.errorCode);
    }
}

void RemoveCalibrationFile(int dir, const std::string &name, const struct stat &created,
    bool identified, Calibration &result)
{
    // Remove only the new inode we created, never a replaced pathname or an installed target.
    struct stat cleanup {};
    if (identified && fstatat(dir, name.c_str(), &cleanup, AT_SYMLINK_NOFOLLOW) == 0 &&
        cleanup.st_dev == created.st_dev && cleanup.st_ino == created.st_ino) {
        result.removed = unlinkat(dir, name.c_str(), 0) == 0;
        if (!result.removed) {
            result.cleanupErrorCode = errno;
        }
    } else {
        result.cleanupErrorCode = ESTALE;
    }
}

class CalibrationCleanupGuard {
public:
    CalibrationCleanupGuard(int dir, const std::string &name, const struct stat &created,
        bool identified, Calibration &result) : dir_(dir), name_(name), created_(created),
        identified_(identified), result_(result) {}
    ~CalibrationCleanupGuard() { Remove(); }
    CalibrationCleanupGuard(const CalibrationCleanupGuard &) = delete;
    CalibrationCleanupGuard &operator=(const CalibrationCleanupGuard &) = delete;

    void Remove()
    {
        if (!completed_) {
            completed_ = true;
            RemoveCalibrationFile(dir_, name_, created_, identified_, result_);
        }
    }

private:
    int dir_;
    const std::string &name_;
    const struct stat &created_;
    bool identified_;
    Calibration &result_;
    bool completed_ = false;
};

Calibration Calibrate(const std::string &directory)
{
    Calibration result;
    ScopedFd dirOwner(open(directory.c_str(), O_RDONLY | O_DIRECTORY | O_CLOEXEC));
    const int dir = dirOwner.Get();
    if (dir < 0) {
        result.errorCode = errno;
        result.message = std::strerror(errno);
        return result;
    }
    if (!ValidateCalibrationDirectory(dir, result)) {
        return result;
    }
    const std::string name = CalibrationName();
    result.path = directory + "/" + name;
    result.phase = "create-new-private-file";
    // Never accept an existing inode. All write/fsync/fadvise operations below use ONLY this new fd.
    ScopedFd fdOwner(openat(dir, name.c_str(), O_CREAT | O_EXCL | O_RDWR | O_CLOEXEC | O_NOFOLLOW, PRIVATE_FILE_MODE));
    const int fd = fdOwner.Get();
    if (fd < 0) {
        result.errorCode = errno;
        result.message = std::strerror(errno);
        return result;
    }
    struct stat created {};
    const bool identified = fstat(fd, &created) == 0;
    const int identifyError = identified ? 0 : errno;
    CalibrationCleanupGuard cleanup(dir, name, created, identified, result);
    result.phase = "identify-new-private-file";
    if (!identified) {
        result.errorCode = identifyError;
    }
    std::vector<unsigned char> buffer(IO_BUFFER_BYTES, CALIBRATION_FILL_BYTE);
    WriteCalibrationFile(fd, identified, buffer, result);
    CompleteCalibration(fd, result);
    cleanup.Remove(); // Update returned cleanup fields before any return-value copy is made.
    return result;
}

napi_value CalibratePrivate(napi_env env, napi_callback_info info)
{
    std::string directory;
    Calibration calibration;
    const PathArgument argument = ArgumentPath(env, info, directory);
    if (argument == PathArgument::NAPI_FAILURE) { return nullptr; }
    if (argument == PathArgument::INVALID) {
        calibration.errorCode = EINVAL;
        calibration.message = "Expected one app-private directory path";
    } else {
        calibration = Calibrate(directory);
    }
    napi_value object = nullptr;
    if (!NapiOk(env, napi_create_object(env, &object))) {
        return nullptr;
    }
    if (!Boolean(env, object, "ok", calibration.ok)) { return nullptr; }
    if (!Boolean(env, object, "passed", calibration.passed)) { return nullptr; }
    if (!Text(env, object, "path", calibration.path)) { return nullptr; }
    if (!Text(env, object, "phase", calibration.phase)) { return nullptr; }
    if (!Number(env, object, "errorCode", calibration.errorCode)) { return nullptr; }
    if (!Text(env, object, "message", calibration.message)) { return nullptr; }
    if (!Number(env, object, "bytesWritten", calibration.bytesWritten)) { return nullptr; }
    if (!Number(env, object, "fsyncReturnCode", calibration.fsyncReturnCode)) { return nullptr; }
    if (!Number(env, object, "fadviseReturnCode", calibration.fadviseReturnCode)) { return nullptr; }
    if (!Boolean(env, object, "removed", calibration.removed)) { return nullptr; }
    if (!Number(env, object, "cleanupErrorCode", calibration.cleanupErrorCode)) { return nullptr; }
    if (!Property(env, object, "afterWrite", Result(env, calibration.afterWrite))) { return nullptr; }
    if (!Property(env, object, "afterDrop", Result(env, calibration.afterDrop))) { return nullptr; }
    if (!Property(env, object, "afterRead", Result(env, calibration.afterRead))) { return nullptr; }
    return object;
}

std::string AddressHex(uintptr_t address)
{
    return UnsignedHex(static_cast<unsigned long long>(address));
}

bool MappingHandle(napi_env env, napi_callback_info info, uint32_t &value)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    if (!NapiOk(env, napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr))) { return false; }
    if (argc != 1) { return true; }
    napi_valuetype type = napi_undefined;
    if (!NapiOk(env, napi_typeof(env, argv[0], &type))) { return false; }
    return type != napi_number || NapiOk(env, napi_get_value_uint32(env, argv[0], &value));
}

bool NullableNumber(napi_env env, napi_value object, const char *key, bool valid, double value)
{
    if (valid) {
        return Number(env, object, key, value);
    }
    napi_value nullValue = nullptr;
    return NapiOk(env, napi_get_null(env, &nullValue)) && Property(env, object, key, nullValue);
}

bool MappingHeader(napi_env env, napi_value object, const HeldMapping &held, uint32_t handle,
    bool active, bool valid, const Probe &file)
{
    if (!Boolean(env, object, "ok", valid)) { return false; }
    if (!Number(env, object, "handle", active ? handle : 0)) { return false; }
    if (!Number(env, object, "errorCode", active ? file.errorCode : ESTALE)) { return false; }
    if (!Text(env, object, "message", valid ? "Held PROT_READ MAP_PRIVATE mapping; not global pagecache quantity" :
        (active ? file.message : "No matching live mapping handle"))) { return false; }
    if (!Number(env, object, "mappedBytes", active ? held.length : 0)) { return false; }
    if (!Text(env, object, "virtualStart", active ? AddressHex(reinterpret_cast<uintptr_t>(held.address)) : "")) {
        return false;
    }
    if (!Text(env, object, "virtualEnd",
        active ? AddressHex(reinterpret_cast<uintptr_t>(held.address) + held.length) : "")) { return false; }
    return true;
}

bool MappingFdPath(napi_env env, napi_value object, const HeldMapping &held, bool active)
{
    std::string fdPath;
    int linkError = 0;
    if (active) {
        char path[MAX_PATH_BYTES + 1];
        const ssize_t count = readlink(("/proc/self/fd/" + std::to_string(held.fd)).c_str(), path, sizeof(path) - 1);
        if (count >= 0) {
            fdPath.assign(path, count);
        } else {
            linkError = errno;
        }
    }
    if (!Text(env, object, "fdPath", fdPath)) { return false; }
    if (!Number(env, object, "fdPathErrorCode", linkError)) { return false; }
    return true;
}

bool TouchMapping(napi_env env, napi_value object, const HeldMapping &held, const Probe &file, bool shouldTouch,
    int64_t &touched, uint32_t &checksum)
{
    struct rusage faultsBefore {};
    struct rusage faultsAfter {};
    int faultScope = RUSAGE_SELF;
#ifdef RUSAGE_THREAD
    faultScope = RUSAGE_THREAD;
#endif
    bool faultsKnown = false;
    if (shouldTouch) {
        faultsKnown = getrusage(faultScope, &faultsBefore) == 0;
        const volatile unsigned char *bytes = static_cast<const volatile unsigned char *>(held.address);
        // Read EVERY file byte via the held mapping. This populates its PTEs, unlike pread().
        for (int64_t index = 0; index < file.fileBytes; ++index) {
            checksum = (checksum ^ bytes[index]) * CHECKSUM_PRIME;
        }
        touched = file.fileBytes;
        faultsKnown = getrusage(faultScope, &faultsAfter) == 0 && faultsKnown;
    }
    if (!Number(env, object, "bytesTouched", touched)) { return false; }
    if (!Number(env, object, "checksum", checksum)) { return false; }
    if (!Text(env, object, "faultScope", faultScope == RUSAGE_SELF ?
        "process-during-synchronous-touch" : "thread-during-synchronous-touch")) { return false; }
    if (!Boolean(env, object, "faultCountersAvailable", faultsKnown)) { return false; }
    if (!NullableNumber(env, object, "minorFaults", faultsKnown,
        faultsAfter.ru_minflt - faultsBefore.ru_minflt)) {
        return false;
    }
    if (!NullableNumber(env, object, "majorFaults", faultsKnown,
        faultsAfter.ru_majflt - faultsBefore.ru_majflt)) {
        return false;
    }
    return true;
}

struct PagemapSample {
    int errorCode = 0;
    int64_t present = 0;
    bool readable = false;
};

bool ReadPagemapEntry(int pagemap, uint64_t page, uint64_t &entry, int &errorCode)
{
    ssize_t count;
    do {
        count = pread(pagemap, &entry, sizeof(entry), page * sizeof(entry));
    } while (count < 0 && errno == EINTR);
    if (count != sizeof(entry)) {
        errorCode = count < 0 ? errno : EIO;
        return false;
    }
    return true;
}

void ReadPresentPages(const HeldMapping &held, const Probe &file, PagemapSample &sample)
{
    ScopedFd pagemapOwner(open("/proc/self/pagemap", O_RDONLY | O_CLOEXEC));
    const int pagemap = pagemapOwner.Get();
    if (pagemap < 0) {
        sample.errorCode = errno;
        return;
    }
    const uint64_t firstPage = reinterpret_cast<uintptr_t>(held.address) / file.pageBytes;
    sample.readable = true;
    for (int64_t index = 0; index < file.totalPages; ++index) {
        uint64_t entry = 0;
        if (!ReadPagemapEntry(pagemap, firstPage + index, entry, sample.errorCode)) {
            sample.readable = false;
            break;
        }
        // Only PRESENT is used/exported, never PFNs or physical addresses.
        if (entry & PAGEMAP_PRESENT_MASK) {
            ++sample.present;
        }
    }
}

void SampleHeldResidency(const HeldMapping &held, Probe &file)
{
    file.ownerOrWritable = held.identity.ownerOrWritable;
    file.ownsFile = held.identity.ownsFile;
    file.writeOpenAllowed = held.identity.writeOpenAllowed;
    file.writeOpenErrno = held.identity.writeOpenErrno;
    file.operation = "held-mapping-mincore";
    std::vector<unsigned char> resident(static_cast<size_t>(file.totalPages));
    if (mincore(held.address, file.fileBytes, resident.data()) == 0) {
        file.ok = true;
        CountResidentPages(resident, file);
        file.residencyTrusted = file.ownerOrWritable;
        file.residencyTrustReason = "legacy mincore raw cache signal; independent of held-mapping PRESENT bits";
    } else {
        Fail(file, "held-mapping-mincore");
    }
}

bool MappingPagemap(napi_env env, napi_value object, const HeldMapping &held, bool valid, const PagemapSample &sample)
{
    if (!Boolean(env, object, "pagemapReadable", sample.readable)) { return false; }
    if (!Boolean(env, object, "pagemapEstablished", valid && held.pagemapEstablished)) { return false; }
    if (!Number(env, object, "pagemapErrorCode", sample.errorCode)) { return false; }
    if (!Text(env, object, "pagemapMeaning",
        "PRESENT PTE count for ONLY virtualStart..virtualEnd; not global filecache or physical memory returned")) {
        return false;
    }
    if (!NullableNumber(env, object, "rawPresentPages", sample.readable, sample.present)) { return false; }
    if (!NullableNumber(env, object, "presentPages",
        valid && sample.readable && held.pagemapEstablished, sample.present)) {
        return false;
    }
    return true;
}

napi_value MappingObservation(napi_env env, HeldMapping &held, uint32_t handle, bool touch)
{
    napi_value object = nullptr;
    if (!NapiOk(env, napi_create_object(env, &object))) {
        return nullptr;
    }
    const bool active = held.fd >= 0 && held.address != MAP_FAILED && held.handle == handle;
    Probe file;
    bool valid = active && Metadata(held.fd, file);
    if (valid && (file.inode != held.identity.inode || file.fileBytes != held.identity.fileBytes)) {
        valid = false;
        file.errorCode = ESTALE;
        file.message = "Held file identity or length changed";
    }
    if (!MappingHeader(env, object, held, handle, active, valid, file)) { return nullptr; }
    if (!MappingFdPath(env, object, held, active)) { return nullptr; }
    int64_t touched = 0;
    uint32_t checksum = CHECKSUM_OFFSET_BASIS;
    if (!TouchMapping(env, object, held, file, valid && touch, touched, checksum)) { return nullptr; }
    PagemapSample sample;
    file.sampleStartedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
    file.sampleWallTimeMs = ClockMs(CLOCK_REALTIME);
    if (valid) {
        ReadPresentPages(held, file, sample);
        if (touch && sample.readable && sample.present == file.totalPages) {
            held.pagemapEstablished = true;
        }
        SampleHeldResidency(held, file);
    }
    file.bytesRead = touched;
    file.checksum = checksum;
    file.sampleCompletedMonotonicMs = ClockMs(CLOCK_MONOTONIC);
    if (!MappingPagemap(env, object, held, valid, sample)) { return nullptr; }
    if (!Property(env, object, "file", Result(env, file))) { return nullptr; }
    return object;
}

napi_value ObserveNewMappingOrRollback(napi_env env, HeldMapping &held)
{
    napi_value result = nullptr;
    try {
        result = MappingObservation(env, held, held.handle, true);
    } catch (...) {
        int cleanupError = 0;
        held.Release(cleanupError);
        throw;
    }
    if (result == nullptr) {
        int cleanupError = 0;
        held.Release(cleanupError); // Preserve failed munmap state for the next begin/env cleanup.
    } else {
        held.unreported = false;
    }
    return result;
}

napi_value BeginMapping(napi_env env, napi_callback_info info)
{
    EnvironmentState *state = CallbackState(env, info);
    if (state == nullptr) { return nullptr; }
    HeldMapping &held = state->held;
    std::string path;
    if (held.unreported) {
        int cleanupError = 0;
        if (!held.Release(cleanupError)) {
            return ThrowError(env, "Previous failed begin still requires native mapping cleanup");
        }
    }
    if (held.fd >= 0) { return ThrowError(env, "Mapping already active or invalid target path"); }
    const PathArgument argument = ArgumentPath(env, info, path);
    if (argument == PathArgument::NAPI_FAILURE) { return nullptr; }
    if (argument == PathArgument::INVALID) {
        return ThrowError(env, "Mapping already active or invalid target path");
    }
    ScopedFd fdOwner(open(path.c_str(), O_RDONLY | O_CLOEXEC));
    const int fd = fdOwner.Get();
    Probe identity;
    if (fd < 0 || !Metadata(fd, identity)) {
        return ThrowError(env, "Cannot open/stat held mapping target");
    }
    PermissionSignal(fd, path, identity);
    const size_t length = static_cast<size_t>(identity.totalPages * identity.pageBytes);
    // Copy any allocating metadata before acquiring the mmap.
    held.identity = identity;
    void *address = mmap(nullptr, length, PROT_READ, MAP_PRIVATE, fd, 0);
    if (address == MAP_FAILED) {
        return ThrowError(env, "PROT_READ MAP_PRIVATE mmap failed");
    }
    held.fd = fdOwner.Take();
    held.address = address;
    held.length = length;
    do { held.handle = ++g_nextMappingHandle; } while (held.handle == 0);
    held.pagemapEstablished = false;
    held.unreported = true;
    return ObserveNewMappingOrRollback(env, held);
}

napi_value SampleMapping(napi_env env, napi_callback_info info)
{
    EnvironmentState *state = CallbackState(env, info);
    if (state == nullptr) { return nullptr; }
    uint32_t handle = 0;
    if (!MappingHandle(env, info, handle)) { return nullptr; }
    return MappingObservation(env, state->held, handle, false);
}

napi_value RereadMapping(napi_env env, napi_callback_info info)
{
    EnvironmentState *state = CallbackState(env, info);
    if (state == nullptr) { return nullptr; }
    uint32_t handle = 0;
    if (!MappingHandle(env, info, handle)) { return nullptr; }
    return MappingObservation(env, state->held, handle, true);
}

napi_value ReleaseMapping(napi_env env, napi_callback_info info)
{
    EnvironmentState *state = CallbackState(env, info);
    if (state == nullptr) { return nullptr; }
    uint32_t handle = 0;
    if (!MappingHandle(env, info, handle)) { return nullptr; }
    HeldMapping &held = state->held;
    const bool active = held.fd >= 0 && held.handle == handle;
    int cleanupError = 0;
    const bool released = active && held.Release(cleanupError);
    napi_value result = nullptr;
    if (!NapiOk(env, napi_get_boolean(env, released, &result))) { return nullptr; }
    return result;
}

napi_value Warm(napi_env env, napi_callback_info info) { return Measure(env, info, true); }
napi_value Sample(napi_env env, napi_callback_info info) { return Measure(env, info, false); }

template<napi_value (*Callback)(napi_env, napi_callback_info)>
napi_value GuardCallback(napi_env env, napi_callback_info info)
{
    try {
        bool pending = false;
        if (!NapiOk(env, napi_is_exception_pending(env, &pending)) || pending) { return nullptr; }
        return Callback(env, info);
    } catch (const std::exception &) {
        return ThrowError(env, "pageprobe native allocation or operation failed");
    } catch (...) {
        return ThrowError(env, "pageprobe native operation failed");
    }
}

napi_value Initialize(napi_env env, napi_value exports)
{
    RetryRetiredMappings();
    auto *state = new (std::nothrow) EnvironmentState();
    if (state == nullptr) { return ThrowError(env, "Cannot allocate pageprobe environment state"); }
    if (!NapiOk(env, napi_add_env_cleanup_hook(env, CleanupEnvironment, state))) {
        delete state;
        return nullptr;
    }
    const napi_property_descriptor descriptors[] = {
        {"warmFile", nullptr, GuardCallback<Warm>, nullptr, nullptr, nullptr, napi_default, state},
        {"sampleFile", nullptr, GuardCallback<Sample>, nullptr, nullptr, nullptr, napi_default, state},
        {"calibratePrivateFile", nullptr, GuardCallback<CalibratePrivate>,
            nullptr, nullptr, nullptr, napi_default, state},
        {"beginMappedFile", nullptr, GuardCallback<BeginMapping>, nullptr, nullptr, nullptr, napi_default, state},
        {"sampleMappedFile", nullptr, GuardCallback<SampleMapping>, nullptr, nullptr, nullptr, napi_default, state},
        {"rereadMappedFile", nullptr, GuardCallback<RereadMapping>, nullptr, nullptr, nullptr, napi_default, state},
        {"releaseMappedFile", nullptr, GuardCallback<ReleaseMapping>, nullptr, nullptr, nullptr, napi_default, state}
    };
    if (!NapiOk(env, napi_define_properties(env, exports, sizeof(descriptors) / sizeof(descriptors[0]), descriptors))) {
        return nullptr; // Registered env cleanup hook owns state, even on partial initialization.
    }
    return exports;
}

napi_value Init(napi_env env, napi_value exports)
{
    try {
        bool pending = false;
        if (!NapiOk(env, napi_is_exception_pending(env, &pending)) || pending) { return nullptr; }
        return Initialize(env, exports);
    } catch (const std::exception &) {
        return ThrowError(env, "pageprobe environment initialization failed");
    } catch (...) {
        return ThrowError(env, "pageprobe environment initialization failed");
    }
}

napi_module g_module = {1, 0, nullptr, Init, "pageprobe", nullptr, {0}};
__attribute__((constructor)) void Register() { napi_module_register(&g_module); }
} // namespace
