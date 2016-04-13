using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace PalindromComplete
{
    public class Palindrom : Hub
    {
        private static int _hitCount = 0;
        public void  RecordHit()
        {

        }
        public void Hello()
        {
            // Clients.All.hello();
            _hitCount += 1;
            this.Clients.All.onHitRecorded(_hitCount);

            
        }
    }
}