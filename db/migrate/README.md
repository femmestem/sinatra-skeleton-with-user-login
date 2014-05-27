Postgres Error
``` > ActiveRecord::NoDatabaseError: FATAL:  role "postgres" does not exist```

fix:
```$ createuser -s -r postgres```