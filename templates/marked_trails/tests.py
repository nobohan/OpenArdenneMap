from datetime import datetime, timedelta

from marked_trails import Y2K, timestamp_to_age_in_days_since_y2k

def test_avg_date():
    print(Y2K)
    
    y2k_timestamp = '2000-01-01T00:00:00Z'
    avg_date = Y2K + timedelta(days=timestamp_to_age_in_days_since_y2k(y2k_timestamp))
    print(Y2K == avg_date)

    _2020_timestamp = '2020-01-01T00:00:00Z'
    d2020 = datetime(year=2020, month=1, day=1)
    avg_date = Y2K + timedelta(days=timestamp_to_age_in_days_since_y2k(_2020_timestamp))
    print(d2020 == avg_date)


if __name__ == '__main__':
    test_avg_date()