#include <bits/stdc++.h>
using namespace std;
using i64 = long long;

template<class Info, class Tag>
struct LazySegmentTree {
    int n;
    vector<Info> info;
    vector<Tag> tag;
    LazySegmentTree() : n(0) {}
    LazySegmentTree(int n_, Info v_ = Info()) { init(n_, v_); }
    void init(int n_, Info v_ = Info()) { init(vector(n_, v_)); }
    template<class T> LazySegmentTree(vector<T> init_) { init(init_); }
    template<class T> void init(vector<T> init_) {
        n = init_.size();
        info.assign(4 << __lg(n), Info());
        tag.assign(4 << __lg(n), Tag());
        function<void(int, int, int)> build = [&](int p, int l, int r) {
            if (r - l == 1) { info[p] = init_[l]; return; }
            int m = (l + r) >> 1;
            build(p << 1, l, m);
            build(p << 1 | 1, m, r);
            pull(p);
        };
        build(1, 0, n);
    }
    void pull(int p) { info[p] = info[p << 1] + info[p << 1 | 1]; }
    void apply(int p, const Tag &v) { info[p].apply(v); tag[p].apply(v); }
    void push(int p) { apply(p << 1, tag[p]); apply(p << 1 | 1, tag[p]); tag[p] = Tag(); }
    Info rangeQuery(int p, int l, int r, int x, int y) {
        if (l >= y || r <= x) return Info();
        if (l >= x && r <= y) return info[p];
        int m = (l + r) >> 1;
        push(p);
        return rangeQuery(p << 1, l, m, x, y) + rangeQuery(p << 1 | 1, m, r, x, y);
    }
    Info rangeQuery(int l, int r) { return rangeQuery(1, 0, n, l, r); }
    void rangeApply(int p, int l, int r, int x, int y, const Tag &v) {
        if (l >= y || r <= x) return;
        if (x <= l && r <= y) { apply(p, v); return; }
        int m = (l + r) >> 1;
        push(p);
        rangeApply(p << 1, l, m, x, y, v);
        rangeApply(p << 1 | 1, m, r, x, y, v);
        pull(p);
    }
    void rangeApply(int l, int r, const Tag &v) { rangeApply(1, 0, n, l, r, v); }
};

struct Tag {
    double add = 0;
    void apply(const Tag &t) & {
        add += t.add;
    }
};

struct Info {
    double sum = 0;
    double sq = 0;
    int len = 0;
    Info () {};
    Info (double val) : sum(val), sq(val * val), len(1) {}
    Info (double sum_, double sq_, int len_) : sum(sum_), sq(sq_), len(len_) {}
    void apply(const Tag &t) & {
        sq += 2.0 * t.add * sum + len * t.add * t.add;
        sum += len * t.add;
    }
};

Info operator+(const Info &a, const Info &b) {
    return { a.sum + b.sum, a.sq + b.sq, a.len + b.len };
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    

    return 0;

}
