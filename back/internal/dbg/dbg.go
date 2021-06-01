package dbg

import (
	"io"
	"log"
	"sync"
)

// DbgLog is thread-safe.
type DbgLog struct {
	mutex sync.Mutex
	log   *log.Logger
}

func New(out io.Writer) *DbgLog {
	var dl DbgLog

	if out == nil {
		return &dl
	}

	dl = DbgLog{
		log: log.New(out, "[debug] ", log.Ldate|log.Ltime),
	}
	return &dl
}

func (l *DbgLog) Log(format string, as ...interface{}) {
	l.mutex.Lock()
	defer l.mutex.Unlock()

	if l.log == nil {
		return
	}

	l.log.Printf(format+"\n", as...)
}

func (l *DbgLog) Off() {
	l.mutex.Lock()
	l.log = nil
	l.mutex.Unlock()
}

func (l *DbgLog) On(out io.Writer) {
	l.mutex.Lock()
	l.log = log.New(out, "[debug] ", log.Ldate|log.Ltime)
	l.mutex.Unlock()
}
